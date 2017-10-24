# coding: utf-8

Pod::Spec.new do |s|
  s.name         = "WeexWXPay"
  s.version      = "0.0.1"
  s.summary      = "Weex 微信支付"

  s.description  = <<-DESC
                   Weexplugin wxpay
                   DESC

  s.homepage     = "https://github.com/WUBOSS/Weex-WXPay"
  s.license = {
    :type => 'MIT',
    :text => <<-LICENSE
            copyright
    LICENSE
  }
  s.authors      = {
                     "WUBOSS" =>"1054258896@qq.com"
                   }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"

  s.source       = { :git => 'https://github.com/WUBOSS/Weex-WXPay.git', :tag => '0.0.1' }
  s.source_files  = "ios/Sources/*.{h,m,mm}"
  s.requires_arc = true
  s.dependency "WeexPluginLoader"
  s.dependency "WeexSDK"
  s.dependency "ShareSDK3/ShareSDKPlatforms/WeChat"
  s.dependency "ShareSDK3"
end
