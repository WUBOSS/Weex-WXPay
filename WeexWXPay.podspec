# coding: utf-8

Pod::Spec.new do |s|
  s.name         = "WeexWXPay"
  s.version      = "0.0.1"
  s.summary      = "Weex Plugin"

  s.description  = <<-DESC
                   Weexplugin Source Description
                   DESC

  s.homepage     = "https://github.com"
  s.license = {
    :type => 'Copyright',
    :text => <<-LICENSE
            copyright
    LICENSE
  }
  s.authors      = {
                     "yourname" =>"youreamail"
                   }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"

  s.source       = { :git => 'please input the url of your code in github', :tag => 'please input you github tag' }
  s.source_files  = "ios/Sources/*.{h,m,mm}","ios/Sources/AliPay/*.{h,m,mm}","ios/Sources/AliPay/openssl/*.{h,m,mm}","ios/Sources/AliPay/Util/*.{h,m,mm}"
  s.vendored_libraries = "ios/Sources/*.a","ios/Sources/AliPay/*.a"
  s.framework = "SystemConfiguration","CoreTelephony"
  s.vendored_frameworks = "ios/Sources/AliPay/AlipaySDK.framework"
  s.requires_arc = true
  s.dependency "WeexPluginLoader"
  s.dependency "WeexSDK"
  s.resource = 'ios/Sources/AliPay/AlipaySDK.bundle'
  s.libraries  = "z","sqlite3","c++","stdc++"
end
