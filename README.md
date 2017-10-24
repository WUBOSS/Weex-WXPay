# Weex-WXPay
Weex-WXPay是一个weex插件，可以通过weexpack快速集成，可以丰富weex功能

支持的weexpack版本： >= 0.2.0
支持的WeexSDK版本： >= 0.10.0

# 功能

# 快速使用
- 通过weexpack初始化一个测试工程 weextest
   ```
   weexpack create weextest
   ```
- 添加ios平台
  ```
  weexpack platform add ios
  ```
- 添加android平台
  ```
  weexpack platform add android
  ```
- 添加插件
  ```
  weexpack plugin add Weex-WXPay
  ```
# 项目地址
[github](please add you source code address)

# 已有工程集成
## iOS集成插件WeexWXPay
- 命令行集成
  ```
  weexpack plugin add Weex-WXPay
  ```
- 手动集成
  在podfile 中添加
  ```
  pod 'WeexWXPay'
  ```

- api

ios 需添加
 ```
 -(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
        {
            [WeexWXPayModule handleOpenURL:url];
            return YES;
        }
        
 ```      
```javascript
    var WXPay = weex.requireModule('WeexWXPay');
    //appid 微信申请的appid
    WXShareModule.registerAPP("appid");
    
   /** 商家向财付通申请的商家id */
   //partnerId;
   /** 预支付订单 */
   //prepayId;
   /** 随机串，防重发 */
   //nonceStr;
   /** 时间戳，防重发 */
   //timeStamp;
   /** 商家根据财付通文档填写的数据和签名 */
   //package;
   /** 商家根据微信开放平台文档对数据做的签名 */
  // sign;
   
    WXPay.WXPay({"partnerid":"","prepayid":"","noncestr":"","timestamp":"","package":"","sign":""},function (ret) {
                    var modal = weex.requireModule('modal')
                    modal.toast({
                        message: JSON.stringify(ret),
                        duration: 0.7
                    })
                });
    //
    //ret
     //   {"status":"success","msg":"支付成功"}
     //status:成功success,失败:error
     //msg:信息描述

```
  
