//
//  WeexWXPayModule.h
//  WeexPluginTemp
//
//  Created by 齐山 on 17/3/14.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
#import "WXApi.h"
CG_EXTERN NSString * const WeexWxPayNotification;
@interface WeexWXPayModule : NSObject<WXModuleProtocol,WXApiDelegate>
+(void)handleOpenURL:(NSURL *)url;

@property(nonatomic,copy)WXModuleCallback callBack;
@end
