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

RCT_EXPORT_METHOD(registerUser: (NSString* _Nonnull)email userId: (NSString* _Nullable)userId name: (NSString* _Nullable)name attributes: (NSDictionary* _Nullable)attributes company: (NSDictionary* _Nullable)company callback: (RCTResponseSenderBlock _Nullable)callback)
{
    [[Customerly sharedInstance] registerUserWithEmail:email user_id:userId name:name attributes:attributes company:company
                                               success:^{
                                                   if (callback) {
                                                       NSArray *someData = @[@"Success"];
                                                       callback(@[[NSNull null], someData]);
                                                   }
                                               } failure:^{
                                                   if (callback) {
                                                       NSArray *someData = @[@"Failure"];
                                                       callback(@[[NSNull null], someData]);
                                                   }
                                               }];
}

RCT_EXPORT_METHOD(openSupport)
{
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.visibleViewController;
    [[Customerly sharedInstance] openSupportFrom:rootViewController];
}

@end

