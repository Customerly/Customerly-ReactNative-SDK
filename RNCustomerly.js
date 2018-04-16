import { NativeModules, Platform } from 'react-native';

const { RNCustomerly } = NativeModules;

export default {
	
    //Configure
    configure: function (appId, color) {
        //@platform android { }
        Platform.select({
  ios: () => RNCustomerly.configure(appId, color),
  android: () => 'TODO',
});
    },
    
    /**
     * Call this method to open the Support Activity.<br>
     * A call to this method will force the enabling if the support logic if it has been previously disabled with {@link #setSupportEnabled(boolean)}
     * <br>
     * You have to configure the RNCustomerly SDK before using this method.
     * Check documentation for the configure
     */
	openSupport: function (vc) {
        Platform.select({
  ios: () => RNCustomerly.openSupport(vc),
  android: () => RNCustomerly.openSupport(),
});
    },
    
    /**
     * Call this method to enable error logging in the Console.
     * Avoid to enable it in release app versions
     */
	setVerboseLogging: function (pEnabled) {
		assert( typeof(variable) == typeof(true),  'pEnabled parameter type expected: boolean');
        RNCustomerly.setVerboseLogging(pEnabled);
    },
    
    /**
     * Call this method to perform a check for pending Surveys or Message for the current user.<br>
     * <br>
     * You have to configure the RNCustomerly SDK before using this method.
     * Check documentation for the configure
     */
    update: function(successCallback = ()=>{}, failureCallback = ()=>{}) {
	    RNCustomerly.update(successCallback, failureCallback);
    }
    
        
    /**
     * Call this method to link your app user to the Customerly session.<br>
     * <br>
     * You have to configure the RNCustomerly SDK before using this method.
     * Check documentation for the configure
     */
    /*registerUser: function(email, user_id = "", name = "", attributes = ReadableMap(), company = ReadableMap(), successCallback = ()=>{}, failureCallback = ()=>{}) {
	    assert(typeof(email) === "string"
	    	&& typeof(user_id) === "string"
	    	&& typeof(name) === "string"
	    	&& typeof(attributes) == typeof(ReadableMap())
	    	&& typeof(company) == typeof(ReadableMap()), "check parameter types");
	    RNCustomerly.registerUser(email, user_id, name, attributes, company, successCallback, failureCallback);
    }/*
    
    /**
     * Call this method to add new custom attributes to the user.<br>
     * <br>
     * You have to configure the RNCustomerly SDK before using this method.
     * Check documentation for the configure
     */
    /*setAttributes: function(attributes = ReadableMap(), successCallback = ()=>{}, failureCallback = ()=>{}) {
	    assert(typeof(attributes) == typeof(ReadableMap()), "check parameter types");
	    RNCustomerly.setAttributes(attributes, successCallback, failureCallback);
    }*/
    
    /**
     * Call this method to add company attributes to the user.<br>
     * <br>
     * You have to configure the RNCustomerly SDK before using this method.
     * Check documentation for the configure
     */
    /*setCompany: function(company = ReadableMap(), successCallback = ()=>{}, failureCallback = ()=>{}) {
	    assert(typeof(company) == typeof(ReadableMap()), "check parameter types");
	    RNCustomerly.setCompany(company, successCallback, failureCallback);
    }*/
    
    /**
     * Call this method to close the user's Customerly session.<br>
     * <br>
     * You have to configure the RNCustomerly SDK before using this method.
     * Check documentation for the configure
     */
    /*logoutUser: function() {
	    RNCustomerly.logoutUser();
    }*/
    
    /**
     * Call this method to keep track of custom labeled events.<br>
     * <br>
     * You have to configure the RNCustomerly SDK before using this method.
     * Check documentation for the configure
     */
    /*trackEvent: function(pEventName) {
	    assert(typeof(email) === "string", "check parameter types");
	    RNCustomerly.trackEvent();
    }*/
    
    /**
     * Call this method to disable or enable the message receiving. It is ENABLED by default.
     */
    /*setSupportEnabled: function(pEnabled) {
		assert( typeof(variable) == typeof(true),  'pEnabled parameter type for setSupportEnabled boolean expected', "check parameter types");
	    RNCustomerly.setSupportEnabled();
    }*/
    
    /**
     * Call this method to disable or enable the survey receiving. It is ENABLED by default
     */
    /*setSurveysEnabled: function(pEnabled) {
		assert( typeof(variable) == typeof(true), "check parameter types");
		RNCustomerly.setSurveysEnabled();
    }*/
};