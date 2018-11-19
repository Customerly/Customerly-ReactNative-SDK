#import "RNCustomerly.h"
#import "UIWindow+Customerly.h"
#import <React/RCTBridgeModule.h>
//#import <CustomerlySDK/CustomerlySDK-umbrella.h>

@implementation RNCustomerly

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(registerUser: (NSString*)email userId: (NSString*)userId name: (NSString*)name callback: (RCTResponseSenderBlock)callback)
{
    [[Customerly sharedInstance] registerUserWithEmail:email user_id:userId name:name attributes:NULL company:NULL
                                               success:^{
                                                   NSArray *someData = @[@"Success"];
                                                   callback(@[[NSNull null], someData]);
                                               } failure:^{
                                                   NSArray *someData = @[@"Failure"];
                                                   callback(@[[NSNull null], someData]);
                                               }];
}

RCT_EXPORT_METHOD(openSupport)
{
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.visibleViewController;
    [[Customerly sharedInstance] openSupportFrom:rootViewController];
}

@end

