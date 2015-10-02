//
//  BaseClassViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

#import "MSWebDataClient.h"

@protocol MSBaseClassViewModelDelegate <NSObject>


@end


@interface MSBaseClassViewModel : NSObject<MSBaseClassViewModelDelegate>


@end
