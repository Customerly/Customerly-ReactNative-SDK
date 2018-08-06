
package io.customerly.rn;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableMapKeySetIterator;
import com.facebook.react.bridge.ReadableType;

import org.jetbrains.annotations.Contract;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import io.customerly.Customerly;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

public class RNCustomerlyModule extends ReactContextBaseJavaModule {

//    private final ReactApplicationContext reactContext;

    RNCustomerlyModule(ReactApplicationContext reactContext) {
        super(reactContext);
//        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNCustomerly";
    }


    /**
     * Call this method to link your app user to the Customerly session.<br>
     * <br>
     * You have to configure the Customerly SDK before using this method with [.configure]
     *
     * @param email      The user email address
     * @param userId     Optional. The user id
     * @param name       Optional. The user name
     * @param attributes Optional. The user attributes HashMap<String, Any>
     * @param company    Optional. The user company HashMap<String, Any>. Remember a company map must contain a 'company_id' and a 'name'
     * @param callback   receive true if the task completes successfully, false otherwise<br>
     * @throws IllegalArgumentException is thrown if the attributes check fails
     */
    @ReactMethod
    public void registerUser(
            @NonNull String email,
            @Nullable String userId,
            @Nullable String name,
            @Nullable ReadableMap attributes,
            @Nullable ReadableMap company,
            @Nullable final Callback callback) {
        Customerly.registerUser(
                email,
                userId,
                name,
                readableMap2hashmap(attributes),
                readableMap2hashmap(company),
                new Function0<Unit>() {
                    @Override
                    public Unit invoke() {
                        if (callback != null) {
                            callback.invoke(true);
                        }
                        return null;
                    }
                },
                new Function0<Unit>() {
                    @Override
                    public Unit invoke() {
                        if (callback != null) {
                            callback.invoke(false);
                        }
                        return null;
                    }
                }
        );

    }
    /**
     * Call this method to close the user's Customerly session.<br>
     * <br>
     * You have to configure the Customerly SDK before using this method with [.configure]
     */
    @ReactMethod
    public void logoutUser(@Nullable Callback callback) {
        Customerly.logoutUser();
        if (callback != null) {
            callback.invoke(null, null);
        }
    }

    /**
     * Call this method to open the Support Activity.<br></br>
     * A call to this method will force the enabling if the support logic if it has been previously disabled with [.setSupportEnabled]
     * <br></br>
     * You have to configure the Customerly SDK before using this method with [.configure]
     */
    @ReactMethod
    public void openSupport(@Nullable Callback callback) {
        Activity currentActivity = this.getCurrentActivity();
        if (currentActivity != null) {
            Customerly.openSupport(currentActivity);
            if (callback != null) {
                callback.invoke(null, null);
            }
        } else {
            if (callback != null) {
                callback.invoke("Error: no current activity available");
            }
        }
    }

    /**
     * Returns true if the SDK is available, false otherwise
     */
    @ReactMethod
    public void isSdkAvailable(@NonNull Callback callback) {
        callback.invoke(Customerly.isSdkAvailable());
    }

    /**
     * Call this method to set custom attributes to the user.<br>
     * <br>
     * You have to configure the Customerly SDK before using this method with [.configure]
     *
     * @param attributes Attributes HashMap for the user. Can contain only String, char, int, long, float or double values
     * @param callback   receive true if the task completes successfully, false otherwise
     * @throws IllegalArgumentException is thrown if the attributes check fails
     */
    @ReactMethod
    public void setAttributes(@NonNull ReadableMap attributes, @Nullable final Callback callback) {
        Customerly.setAttributes(
                this.readableMap2hashmap(attributes),
                new Function0<Unit>() {
                    @Override
                    public Unit invoke() {
                        if (callback != null) {
                            callback.invoke(true);
                        }
                        return null;
                    }
                },
                new Function0<Unit>() {
                    @Override
                    public Unit invoke() {
                        if (callback != null) {
                            callback.invoke(false);
                        }
                        return null;
                    }
                });
    }

    /**
     * Call this method to set custom attributes to the user.<br>
     * <br>
     * You have to configure the Customerly SDK before using this method with [.configure]
     *
     * @param company  Company attributes map for the user. Can contain only String, char, int, long, float or double values and must contain the company id and name with keys 'company_id' and 'name'
     * @param callback receive true if the task completes successfully, false otherwise
     * @throws IllegalArgumentException is thrown if the attributes check fails
     */
    @ReactMethod
    public void setCompany(@NonNull ReadableMap company, @Nullable final Callback callback) {
        Customerly.setCompany(
                this.readableMap2hashmap(company),
                new Function0<Unit>() {
                    @Override
                    public Unit invoke() {
                        if (callback != null) {
                            callback.invoke(true);
                        }
                        return null;
                    }
                },
                new Function0<Unit>() {
                    @Override
                    public Unit invoke() {
                        if (callback != null) {
                            callback.invoke(false);
                        }
                        return null;
                    }
                });
    }

    /**
     * Set to true or false to enable or disable the message receiving. It is ENABLED by default.<br>
     * A call to the method [.openSupport(Activity)] will force the enabling if it is disabled
     */
    @ReactMethod
    public void setSupportEnabled(boolean enabled, @Nullable Callback callback) {
        Customerly.setSupportEnabled(enabled);
        if (callback != null) {
            callback.invoke(null, null);
        }
    }

    /**
     * @param callback receive true if the support is enabled, false otherwise
     */
    @ReactMethod
    public void isSupportEnabled(@NonNull Callback callback) {
        callback.invoke(Customerly.isSupportEnabled());
    }

    /**
     * Set to true or false to enable or disable the message receiving. It is ENABLED by default.<br>
     * A call to the method [.openSupport(Activity)] will force the enabling if it is disabled
     */
    @ReactMethod
    public void setSurveyEnabled(boolean enabled, @Nullable Callback callback) {
        Customerly.setSurveyEnabled(enabled);
        if (callback != null) {
            callback.invoke(null, null);
        }
    }

    /**
     * @param callback receive true if the surveys are enabled, false otherwise
     */
    @ReactMethod
    public void isSurveyEnabled(@NonNull Callback callback) {
        callback.invoke(Customerly.isSurveyEnabled());
    }

    /**
     * Call this method to keep track of custom labeled events.<br></br>
     * <br></br>
     * You have to configure the Customerly SDK before using this method with [.configure]
     *
     * @param eventName The event custom label
     */
    @ReactMethod
    public void trackEvent(@NonNull String eventName, @Nullable Callback callback) {
        Customerly.trackEvent(eventName);
        if (callback != null) {
            callback.invoke(null, null);
        }
    }

    /**
     * Call this method to force a check for pending Surveys or Message for the current user.<br>
     *
     * @param callback receive true if the task completes successfully, false otherwise<br>
     *                 <br>
     *                 You have to configure the Customerly SDK before using this method with [.configure()]
     */
    @ReactMethod
    public void update(@Nullable final Callback callback) {
        Customerly.update(
                new Function0<Unit>() {
                    @Override
                    public Unit invoke() {
                        if (callback != null) {
                            callback.invoke(true);
                        }
                        return null;
                    }
                },
                new Function0<Unit>() {
                    @Override
                    public Unit invoke() {
                        if (callback != null) {
                            callback.invoke(false);
                        }
                        return null;
                    }
                });
    }

    /**
     * Set to true to enable error logging in the Console.
     * Avoid to enable it in release app versions, the suggestion is to pass your.application.package.BuildConfig.DEBUG as set value
     */
    @ReactMethod
    public void setVerboseLogging(boolean enabled, @Nullable Callback callback) {
        Customerly.setVerboseLogging(enabled);
        if (callback != null) {
            callback.invoke(null, null);
        }
    }

    /**
     * Set to false to disable the attachment button inside the chat.
     * It is enabled by default
     */
    @ReactMethod
    public void setAttachmentsAvailable(boolean enabled, @Nullable Callback callback) {
        Customerly.setAttachmentsAvailable(enabled);
        if (callback != null) {
            callback.invoke(null, null);
        }
    }

    @Nullable
    @Contract("null -> null; !null->!null")
    private HashMap<String, Object> readableMap2hashmap(@Nullable ReadableMap readableMap) {
        if (readableMap == null) {
            return null;
        }
        ReadableMapKeySetIterator iterator = readableMap.keySetIterator();
        HashMap<String, Object> deconstructedMap = new HashMap<>();
        while (iterator.hasNextKey()) {
            String key = iterator.nextKey();
            ReadableType type = readableMap.getType(key);
            switch (type) {
                case Null:
                    deconstructedMap.put(key, null);
                    break;
                case Boolean:
                    deconstructedMap.put(key, readableMap.getBoolean(key));
                    break;
                case Number:
                    deconstructedMap.put(key, readableMap.getDouble(key));
                    break;
                case String:
                    deconstructedMap.put(key, readableMap.getString(key));
                    break;
                case Map:
                    deconstructedMap.put(key, this.readableMap2hashmap(readableMap.getMap(key)));
                    break;
                case Array:
                    deconstructedMap.put(key, this.readableArray2list(readableMap.getArray(key)));
                    break;
                default:
                    throw new IllegalArgumentException("Could not convert object with key: " + key + ".");
            }

        }
        return deconstructedMap;
    }

    @Nullable
    @Contract("null -> null; !null->!null")
    private List<Object> readableArray2list(@Nullable ReadableArray readableArray) {
        if (readableArray == null) {
            return null;
        }
        List<Object> deconstructedList = new ArrayList<>(readableArray.size());
        for (int i = 0; i < readableArray.size(); i++) {
            ReadableType indexType = readableArray.getType(i);
            switch (indexType) {
                case Null:
                    deconstructedList.add(i, null);
                    break;
                case Boolean:
                    deconstructedList.add(i, readableArray.getBoolean(i));
                    break;
                case Number:
                    deconstructedList.add(i, readableArray.getDouble(i));
                    break;
                case String:
                    deconstructedList.add(i, readableArray.getString(i));
                    break;
                case Map:
                    deconstructedList.add(i, this.readableMap2hashmap(readableArray.getMap(i)));
                    break;
                case Array:
                    deconstructedList.add(i, this.readableArray2list(readableArray.getArray(i)));
                    break;
                default:
                    throw new IllegalArgumentException("Could not convert object at index " + i + ".");
            }
        }
        return deconstructedList;
    }

}