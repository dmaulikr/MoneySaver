//
//  ProjectManagerViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewModel.h"
#import "MSProjectViewModel.h"

@interface MSProjectManagerViewModel : MSBaseClassViewModel


@property (nonatomic, strong) NSArray <__kindof MSBaseProjectModel*> *projectArray;
@property (nonatomic, strong) NSDictionary <NSString *,MSBaseProjectModel *> *projectTypeDict;

@property (nonatomic, assign) BOOL autoCreateProjectTypeDict;
@property (nonatomic, strong) NSError *selectError;



@end


@interface MSProjectManagerViewModel (SQLQuery)

//Select by Date
- (void)selectCurrentMonth;
- (void)selectByDate:(NSDate *)date;
- (void)selectByYear:(NSString *)year month:(NSString *)month day:(NSString *)day;

//Short
- (void)shortByValue:(BOOL)desc;
- (void)shortByDate:(BOOL)desc;


//filter
- (void)filerBySourceId:(NSString *)sourceId;
- (void)filerByTransactionType:(MSProjectTransactionType)type;


@end