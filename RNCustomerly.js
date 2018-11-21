import { NativeModules } from 'react-native';

const { RNCustomerly } = NativeModules;

module.exports = {
  openSupport: callback => {
    if (callback) {
      RNCustomerly.openSupport(callback);
    } else {
      RNCustomerly.openSupport();
    }
  },
  registerUser: async (email, userId = null, name = null, attributes = null, company = null) => {
    return RNCustomerly.registerUser(email, userId, name, attributes, company);
  },
  logoutUser: () => {
      RNCustomerly.logoutUser();
  },
  isSdkAvailable: async () => {
    return RNCustomerly.isSdkAvailable();
  }
};

// setAttributes(attributes, callback) {
//   RNCustomerly.setAttributes(attributes, callback);
// }

// setCompany(company, callback) {
//   RNCustomerly.setCompany(attributes, callback);
// }

// setSupportEnabled(enabled, callback) {
//   RNCustomerly.setSupportEnabled(enabled, callback);
// }

// isSupportEnabled(callback) {
//   RNCustomerly.isSupportEnabled(callback);
// }

// setSurveyEnabled(enabled, callback) {
//   RNCustomerly.setSurveyEnabled(enabled, callback);
// }

// isSurveyEnabled(callback) {
//   RNCustomerly.isSurveyEnabled(callback);
// }

// trackEvent(eventName, callback) {
//   RNCustomerly.trackEvent(eventName, callback);
// }

// update(callback) {
//   RNCustomerly.update(callback);
// }

// setVerboseLogging(enabled, callback) {
//   RNCustomerly.setVerboseLogging(enabled, callback);
// }

// setAttachmentsAvailable(enabled, callback) {
//   RNCustomerly.setAttachmentsAvailable(enabled, callback);
// }
