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

RCT_EXPORT_METHOD(openSupport)
{
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.visibleViewController;
    [[Customerly sharedInstance] openSupportFrom:rootViewController];
}

RCT_EXPORT_METHOD(registerUser: (NSString* _Nonnull)email userId: (NSString* _Nullable)userId name: (NSString* _Nullable)name attributes: (NSDictionary* _Nullable)attributes company: (NSDictionary* _Nullable)company registerUserWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] registerUserWithEmail:email user_id:userId name:name attributes:attributes company:company
            success:^{
                resolve(@YES);
            } failure:^{
                NSError *error = [[NSError alloc] initWithDomain:@"io.customerly" code:200 userInfo:NULL];
                reject(@"error", @"User registration failed", error);
            }];
}

RCT_EXPORT_METHOD(logoutUser: (RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] logoutUser];
    resolve(@YES);
}

RCT_EXPORT_METHOD(isSdkAvailable: (RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    BOOL isAvailable = [[Customerly sharedInstance] isSDKAvailable];
    
    if (isAvailable) {
        resolve(isAvailable ? @YES : @NO);
    } else {
        NSError *error = [[NSError alloc] initWithDomain:@"io.customerly" code:200 userInfo:NULL];
        reject(@"error", @"Customerly SDK not available", error);
    }
}

RCT_EXPORT_METHOD(setAttributes: (NSDictionary* _Nullable)attributes resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] setAttributesWithAttributes:attributes
            success:^{
                resolve(@YES);
            } failure:^{
                NSError *error = [[NSError alloc] initWithDomain:@"io.customerly" code:200 userInfo:NULL];
                reject(@"error", @"Set attributes failed", error);
            }];
}

RCT_EXPORT_METHOD(setCompany: (NSDictionary* _Nullable)company resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] setCompanyWithCompany:company
            success:^{
                resolve(@YES);
            } failure:^{
                NSError *error = [[NSError alloc] initWithDomain:@"io.customerly" code:200 userInfo:NULL];
                reject(@"error", @"Set company failed", error);
            }];
}

RCT_EXPORT_METHOD(setSupportEnabled: (BOOL)enabled resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] setSupportEnabled:enabled];
    resolve(@YES);
}

RCT_EXPORT_METHOD(isSupportEnabled: (RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    resolve([[Customerly sharedInstance] supportEnabled] ? @YES : @NO);
}

RCT_EXPORT_METHOD(setSurveyEnabled: (BOOL)enabled resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] setSurveyEnabled:enabled];
    resolve(@YES);
}

RCT_EXPORT_METHOD(isSurveyEnabled:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    resolve([[Customerly sharedInstance] surveyEnabled] ? @YES : @NO);
}

RCT_EXPORT_METHOD(trackEvent: (NSString* _Nonnull)event resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] trackEventWithEvent:event];
    resolve(@YES);
}

RCT_EXPORT_METHOD(update: (RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] updateWithSuccess:^{
                resolve(@YES);
            } failure:^{
                NSError *error = [[NSError alloc] initWithDomain:@"io.customerly" code:200 userInfo:NULL];
                reject(@"error", @"Update failed", error);
            }];
}

RCT_EXPORT_METHOD(setVerboseLogging: (BOOL)enabled resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[Customerly sharedInstance] setVerboseLogging:enabled];
    resolve(@YES);
}

@end

