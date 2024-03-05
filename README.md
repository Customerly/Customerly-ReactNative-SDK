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
```

For all the explanation and the methods signature you can check directly the native SDK at the following links:
 - iOS: https://github.com/customerly/Customerly-iOS-SDK
 - Android: https://github.com/customerly/Android-SDK
