#import "RNCustomerly.h"
#import "UIWindow+Customerly.h"
#import <React/RCTBridgeModule.h>

@implementation RNCustomerly

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(registerUser, email:(NSString* _Nonnull)email userId: (NSString* _Nullable)userId name: (NSString* _Nullable)name attributes: (NSDictionary* _Nullable)attributes company: (NSDictionary* _Nullable)company registerUserWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] registerUserWithEmail:email user_id:userId name:name attributes:attributes company:company
                                               success:^{
                                                   resolve(@YES);
                                               } failure:^{
                                                   NSError *error = [[NSError alloc] initWithDomain:@"io.customerly" code:200 userInfo:NULL];
                                                   reject(@"error", @"User registration failed", error);
                                               }];
}

RCT_EXPORT_METHOD(openSupport)
{
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.visibleViewController;
    [[Customerly sharedInstance] openSupportFrom:rootViewController];
}

RCT_EXPORT_METHOD(logoutUser)
{
    [[Customerly sharedInstance] logoutUser];
}

RCT_REMAP_METHOD(isSdkAvailable, isSdkAvailableWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    BOOL isAvailable = [[Customerly sharedInstance] isSDKAvailable];
    
    if (isAvailable) {
        resolve(isAvailable ? @YES : @NO);
    } else {
        NSError *error = [[NSError alloc] initWithDomain:@"io.customerly" code:200 userInfo:NULL];
        reject(@"error", @"Customerly SDK not available", error);
    }
}

@end

