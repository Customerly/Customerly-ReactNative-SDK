<div align="center">

🚨🚨🚨

<h1>DEPRECATION NOTICE</h1>
<p><strong>This SDK is DEPRECATED and no longer maintained.</strong></p>
<p>Please use the new and improved Customerly React Native SDK here:</p>
<a href="https://github.com/Customerly/CustomerlyReactNativeSDK" style="font-size:1.5em; font-weight:bold; color:#007aff;">https://github.com/Customerly/CustomerlyReactNativeSDK</a>

🚨🚨🚨

</div>

---

# react-native-customerly

## Getting started

`$ npm install react-native-customerly --save`

Or if you are using yarn:

`$ yarn add react-native-customerly`

### iOS

1. Run `cd ios` on your main project folder
2. Run `pod install`
3. Open your `AppDelegate.mm` file
4. Add import `#import <CustomerlySDK/CustomerlySDK-Swift.h>`
5. Add the following code in your `didFinishLaunchingWithOptions` function:
   ```
   [[Customerly sharedInstance] configureWithAppId:@"YOUR_APP_ID" widgetColor:nil];
   [[Customerly sharedInstance] activateApp];
   ```

The Customerly iOS Pod requires `use_frameworks!` to be set in your `ios/Podfile`.

```
target 'AppName' do
  config = use_native_modules!
  use_frameworks!
  use_react_native!(:path => config["reactNativePath"])

  # Insert your existing Podfile configuration

  dynamic_frameworks = ['CustomerlySDK' ]
  pre_install do |installer|
    installer.pod_targets.each do |pod|
      if !dynamic_frameworks.include?(pod.name)
        puts "Overriding the static_framework? method for #{pod.name}"
        def pod.static_framework?;
          true
        end
        def pod.build_type;
          Pod::BuildType.static_library
        end
      end
    end
  end
  
# Insert your existing Podfile configuration

end
```

This will essentially set `use_frameworks!` to be active by default for all pods, but skip it for any pod that isn't `CustomerlySDK`.

If you get any errors when running `pod install` about transient libraries, add those libraries names to the `dynamic_frameworks` array.

### Android

1. Open your `MainApplication.java` file
2. Add import `import io.customerly.Customerly;`
3. Add the following code in your `onCreate` function:
  ```
  Customerly.configure(this, "YOUR_APP_ID");
  ```
4. Add into your **android** level `build.gradle` the following maven repository:
  ```
  allprojects {
    repositories {
        ...
        maven { url 'https://jitpack.io' }
    }
  }
  ```

## Usage

```javascript
import {
  registerUser,
  logoutUser,
  openSupport,
  isSdkAvailable,
  setAttributes,
  setCompany,
  setSupportEnabled,
  isSupportEnabled,
  setSurveyEnabled,
  isSurveyEnabled,
  trackEvent,
  update,
  setVerboseLogging,
} from "react-native-customerly";

await registerUser(email, userId, name, attributes, company);

await logoutUser();

await openSupport();

await isSdkAvailable();

await setAttributes(attributes);

await setCompany(attributes);

await setSupportEnabled(enabled);

await isSupportEnabled();

await setSurveyEnabled(enabled);

await isSurveyEnabled();

await trackEvent(eventName);

await update();

await setVerboseLogging(enabled);
```

For all the explanation and the methods signature you can check directly the native SDK at the following links:
 - iOS: https://github.com/customerly/Customerly-iOS-SDK
 - Android: https://github.com/customerly/Android-SDK
