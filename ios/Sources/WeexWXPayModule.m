//
//  WeexWXPayModule.m
//  WeexPluginTemp
//
//  Created by  on 17/3/14.
//  Copyright © 2017年 . All rights reserved.
//

#import "WeexWXPayModule.h"
#import <WeexPluginLoader/WeexPluginLoader.h>

@implementation WeexWXPayModule

WX_PlUGIN_EXPORT_MODULE(WeexWXPay, WeexWXPayModule)
WX_EXPORT_METHOD(@selector(WXPay: callBack:))
WX_EXPORT_METHOD(@selector(registerAPP:))
-(void)registerAPP:(NSString *)APPID
{
    [WXApi registerApp:APPID];
}

-(void)WXPay:(NSDictionary *)param callBack:(WXModuleCallback)callBack
{
    
    self.callBack = callBack;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payResult:) name:@"WeexWxPayNotification" object:nil];
    
    
    if(![param isKindOfClass:[NSDictionary class]])
    {
         [[NSNotificationCenter defaultCenter] removeObserver:self];
        if(self.callBack)
        callBack(@{@"status":@"error",@"msg":@"参数不是josn"});
        
    }
    
    //调起微信支付
    PayReq* req             = [[PayReq alloc] init];
    req.partnerId           = [param objectForKey:@"partnerid"];
    req.prepayId            = [param objectForKey:@"prepayid"];
    req.nonceStr            = [param objectForKey:@"noncestr"];
    req.timeStamp           = [[param objectForKey:@"timestamp"] intValue];
    req.package             = [param objectForKey:@"package"];
    req.sign                = [param objectForKey:@"sign"];
    BOOL flag =[WXApi sendReq:req];
    
    if(flag==NO){
         [[NSNotificationCenter defaultCenter] removeObserver:self];
        if(self.callBack)
        callBack(@{@"status":@"error",@"msg":@"唤起微信失败,检查参数配置"});
    }
}
-(void)dealloc
{
    NSLog(@"%s",__func__);
   [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%s",__func__);
}
+(void)handleOpenURL:(NSURL *)url
{
    [WXApi handleOpenURL:url delegate:[self new]];
}
-(void)payResult:(NSNotification*)no;
{
    BaseResp *res=[no.userInfo objectForKey:@"key"];
    
    if( [res isKindOfClass:[PayResp class]])
    {
         [[NSNotificationCenter defaultCenter] removeObserver:self];
        switch (res.errCode) {
                
            case WXSuccess:
                if(self.callBack)
                self.callBack(@{@"status":@"success",@"msg":@"支付成功"})   ;                 break;
            default:
                if(self.callBack)
                self.callBack(@{@"status":@"error",@"msg":res.errStr})   ;
                
                break;
        }
    }
    
    
}
- (void)onResp:(BaseResp *)resp
{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"WeexWxPayNotification" object:nil userInfo:@{@"key":resp}];
    
    
}

@end
