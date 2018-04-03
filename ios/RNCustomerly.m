
#import "RNCustomerly.h"
#import <CustomerlySDK/CustomerlySDK-Swift.h>

@implementation RNCustomerly

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(configure: (NSString*)appId widgetColor: (UIColor*)color){
    [[Customerly sharedInstance] configureWithAppId:appId widgetColor:color];
}

RCT_EXPORT_METHOD(openSupport: (UIViewController *)vc){
    [[Customerly sharedInstance] openSupportFrom:vc];
}

@end

