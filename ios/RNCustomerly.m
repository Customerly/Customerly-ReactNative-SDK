#import "RNCustomerly.h"
#import "UIWindow+Customerly.h"
//#import <CustomerlySDK/CustomerlySDK-umbrella.h>

@implementation RNCustomerly

@synthesize bridge = _bridge;

typedef void (^SuccessTestCallback)(void);

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(registerUser: (NSString*)email userId: (NSString*)userId name: (NSString*)name successCallback: (SuccessTestCallback)successCallback)
{
    //    [[Customerly sharedInstance] registerUserWithEmail:email user_id:userId name:name];
}

RCT_EXPORT_METHOD(openSupport)
{
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.visibleViewController;
    [[Customerly sharedInstance] openSupportFrom:rootViewController];
}

@end

