//
//  MSBmobDataBojectModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/26.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Mantle.h>
#import <BmobSDK/BmobFile.h>

@interface MSBmobDataBojectModel : MTLModel<MTLJSONSerializing>


@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSData   *fileData;


@end
