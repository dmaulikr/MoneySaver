//
//  ProjectManagerViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectManagerViewModel.h"
#import "MSProjectModelTypeHelper.h"


#import "NSDateFormatter+DefaultFormatter.h"
#import "MSSqliteQueryCondition.h"

@interface MSProjectManagerViewModel ()

@property (nonatomic, strong) MSSqliteQueryCondition *queryCondition;

@end

@implementation MSProjectManagerViewModel

#pragma mark - Life Cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        _autoCreateProjectTypeDict = YES;
        [self configureSignal];
    }
    return self;
}

#pragma mark - Private Method
- (void)configureSignal
{
    @weakify(self);
    [[[RACObserve(self, projectArray)
      filter:^BOOL(id value) {
          @strongify(self);
          return (self.autoCreateProjectTypeDict && value != nil);
    }]deliverOn:[RACScheduler schedulerWithPriority:RACSchedulerPriorityDefault]]
     subscribeNext:^(id x) {
         @strongify(self);
         [self findProjectTypeForArray];
    }];
}


- (void)findProjectTypeForArray
{
    //Type集合
    NSMutableArray *muArry = [NSMutableArray new];
    NSArray *valueForyType = [self.projectArray valueForKeyPath:@"@distinctUnionOfObjects.projectType"];
    for (NSNumber *type in valueForyType) {
        //筛选
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"projectType == %@",type];
        NSArray *result = [self.projectArray filteredArrayUsingPredicate:predicate];
        
        //求和
        NSNumber *sum = [result valueForKeyPath:@"@sum.value.doubleValue"];
        NSString *typeName = [MSProjectModelTypeHelper projectModelTypeToChinese:type.unsignedIntegerValue];
        
        //创建存储模型
        MSBaseProjectModel *projectModel = [MSBaseProjectModel new];
        projectModel.projectType = type.unsignedIntegerValue;
        projectModel.name = typeName;
        projectModel.value = sum;
        [muArry addObject:projectModel];
    }
    self.projectTypeArray = muArry;
}


#pragma mark - Getter
- (MSSqliteQueryCondition *)queryCondition
{
    if (!_queryCondition) {
        _queryCondition = [MSSqliteQueryCondition new];
    }
    return _queryCondition;
}

@end


@implementation MSProjectManagerViewModel (SQLQuery)

#pragma mark - Public Method
//Select by Date
- (void)selectCurrentMonth
{
    NSString *date = [[NSDateFormatter commonDateFormatter] stringFromDate:[NSDate date]];
    NSArray  *dateComponentArray = [date componentsSeparatedByString:@"-"];
    [self selectByYear:[dateComponentArray firstObject] month:dateComponentArray[2] day:nil];
}
- (void)selectByDate:(NSDate *)date
{
    self.queryCondition.likeName  = @"date";
    self.queryCondition.likeValue = [[[NSDateFormatter commonDateFormatter] stringFromDate:date] stringByAppendingString:@"%"];
    self.queryCondition.shortName = @"date";
    self.queryCondition.shortDesc = NO;
    [self queryWithCondition];
}
- (void)selectByYear:(NSString *)year month:(NSString *)month day:(NSString *)day
{
    self.queryCondition.likeName  = @"date";
    self.queryCondition.likeValue = [NSString stringWithFormat:@"%@-%@-%@%%",year?:@"____",month?:@"__",day?:@"__"];
    self.queryCondition.shortName = @"date";
    self.queryCondition.shortDesc = NO;
    [self queryWithCondition];
}



//Short
- (void)shortByValue:(BOOL)desc
{
    self.queryCondition.shortName = @"value";
    self.queryCondition.shortDesc = desc;
    [self queryWithCondition];
}
- (void)shortByDate:(BOOL)desc
{
    self.queryCondition.shortName = @"date";
    self.queryCondition.shortDesc = desc;
    [self queryWithCondition];
}




//filter
- (void)filerBySourceId:(NSString *)sourceId
{
    self.queryCondition.filterName = @"objectId";
    self.queryCondition.filterValue = sourceId;
    [self queryWithCondition];
}
- (void)filerByTransactionType:(MSProjectTransactionType)type
{
    self.queryCondition.filterName = @"transactionType";
    self.queryCondition.filterValue = @(type);
    [self queryWithCondition];
}



#pragma mark - Private Method
- (void)queryWithCondition
{
    NSString *query = [self.queryCondition createQueryCondition];
    NIDPRINT(@"%@",query);
    self.projectArray = [MSBaseProjectModel searchWithWhere:query];
    
}

@end

