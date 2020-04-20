# react-native-customerly

## Getting started

`$ npm install react-native-customerly --save`

`$ npm install --production`

### Mostly automatic installation

`$ react-native link react-native-customerly`


_PAY ATTENTION_ ‼️: You also need to complete the _additional steps_ before using the SDK

### Additional steps

#### iOS

1. Run `cd ios` on your main project folder
2. Run `pod install`
3. Open you AppDelegate.m
4. Add import `#import <CustomerlySDK/CustomerlySDK-Swift.h>`
5. Add the following code in your `didFinishLaunchingWithOptions`:
   ```
   [[Customerly sharedInstance] configureWithAppId:@"YOUR_APP_ID"];
   [[Customerly sharedInstance] activateApp];
   ```

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`

- Add `import io.customerly.Customerly;`
- Inside your onCreate method add the following code:
  ```
  Customerly.configure(this, "<YOUR_APP_ID>");
  ```

## Usage

```javascript
import RNCustomerly from "react-native-customerly";

await RNCustomerly.registerUser(email, userId, name, attributes, company);

RNCustomerly.logoutUser(() => {});

RNCustomerly.openSupport(() => {});

await RNCustomerly.isSdkAvailable();

RNCustomerly.setAttributes(attributes, callback);

RNCustomerly.setCompany(attributes, callback);

RNCustomerly.setSupportEnabled(enabled, callback);

RNCustomerly.isSupportEnabled(callback);

RNCustomerly.setSurveyEnabled(enabled, callback);

RNCustomerly.isSurveyEnabled(callback);

RNCustomerly.trackEvent(eventName, callback);

RNCustomerly.update(callback);

RNCustomerly.setVerboseLogging(enabled, callback);

RNCustomerly.setAttachmentsAvailable(enabled, callback);
```

For all the explanation and the methods signature you can check directly the native SDK at the following links:
 - iOS: https://github.com/customerly/Customerly-iOS-SDK
 - Android: https://github.com/customerly/Customerly-Android-SDK
