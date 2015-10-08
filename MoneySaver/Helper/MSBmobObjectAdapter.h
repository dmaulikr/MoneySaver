//
//  BmobObjectAdapter.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BmobObject.h>
#import <MTLJSONAdapter.h>


@interface MSBmobObjectAdapter : NSObject

+ (BmobObject *)bmobObjectFromModel:(id <MTLJSONSerializing>)model
                              error:(NSError **)error;

@end
