import { NativeModules } from "react-native";

const { RNCustomerly } = NativeModules;

module.exports = {
  openSupport: async () => {
    return RNCustomerly.openSupport();
  },
  registerUser: (
    email,
    userId = null,
    name = null,
    attributes = null,
    company = null
  ) => RNCustomerly.registerUser(email, userId, name, attributes, company),
  logoutUser: RNCustomerly.logoutUser,
  isSdkAvailable: RNCustomerly.isSdkAvailable,
  setAttributes: RNCustomerly.setAttributes,
  setCompany: RNCustomerly.setCompany,
  setSupportEnabled: RNCustomerly.setSupportEnabled,
  isSupportEnabled: RNCustomerly.isSupportEnabled,
  setSurveyEnabled: RNCustomerly.setSurveyEnabled,
  isSurveyEnabled: RNCustomerly.isSurveyEnabled,
  trackEvent: RNCustomerly.trackEvent,
  update: RNCustomerly.update,
  setVerboseLogging: RNCustomerly.setVerboseLogging,
};
