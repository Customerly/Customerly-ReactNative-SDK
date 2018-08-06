
# react-native-customerly

## Getting started

`$ npm install react-native-customerly --save`

### Mostly automatic installation

`$ react-native link react-native-customerly`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-customerly` and add `RNCustomerly.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCustomerly.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

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


## Usage
```javascript
import RNCustomerly from 'react-native-customerly';

// TODO: What to do with the module?
RNCustomerly;
```
  