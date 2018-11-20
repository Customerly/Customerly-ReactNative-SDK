
# react-native-customerly

## Getting started

`$ npm install react-native-customerly --save`

### Mostly automatic installation

`$ react-native link react-native-customerly`

*PAY ATTENTION* ‼️: You also need to complete the _additional steps_ before using the SDK 

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-customerly` and add `RNCustomerly.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCustomerly.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import io.customerly.rn.RNCustomerlyPackage;` to the imports at the top of the file
  - Add `new RNCustomerlyPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-customerly'
  	project(':react-native-customerly').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-customerly/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
	compile project(':react-native-customerly')
  	```

### Additional steps

#### iOS

1. Open you `PodFile` inside ios folder
  - If you are using swift version 4.1, add this:
  	```
	pod 'CustomerlySDK', '2.1.0'
	```
  - If you are using swift version 4.2, add this:
	```
	pod 'CustomerlySDK', '2.2.0'
	```
2. Run `$ pod install`
3. Open you AppDelegate.m
4. Add import `#import <CustomerlySDK/CustomerlySDK-Swift.h>`
5. Add the following code in your `didFinishLaunchingWithOptions`:
	```
	[[Customerly sharedInstance] configureWithAppId:@"YOUR_APP_ID"];
  	[[Customerly sharedInstance] activateApp];
	```

#### Android	
1. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
	compile 'io.customerly:customerly-android-sdk:2.2.0'
  	```
2. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import io.customerly.Customerly;`
  - Inside you onCreate method add the following code:
  	```
	Customerly.configure(this, "YOUR_APP_ID");
	```

## Usage
```javascript
import RNCustomerly from 'react-native-customerly';

// TODO: What to do with the module?
RNCustomerly;
```
  