declare module "react-native-customerly" {
  export type Attributes = { [key: string]: any };
  export type Company = {
    company_id: string;
    name: string;
  } & {
    [key: string]: any;
  };

  /**
   * Call this method to open the Support Activity.
   *
   * A call to this method will force the enabling if the support logic if it has been previously disabled with [.setSupportEnabled]
   */
  export function openSupport(): Promise<void>;

  /**
   * Call this method to link your app user to the Customerly session.
   *
   * @param email      The user email address
   * @param userId     Optional. The user id
   * @param name       Optional. The user name
   * @param attributes Optional. The user attributes HashMap<String, Any>
   * @param company    Optional. The user company HashMap<String, Any>. Remember a company map must contain a 'company_id' and a 'name'
   */
  export function registerUser(
    email: string,
    userId?: string,
    name?: string,
    attributes?: Attributes,
    company?: Company
  ): Promise<void>;

  /**
   * Call this method to close the user's Customerly session.
   */
  export function logoutUser(): Promise<void>;

  /**
   * Returns true if the SDK is available, false otherwise
   */
  export function isSdkAvailable(): Promise<boolean>;

  /**
   * Call this method to set custom attributes to the user.
   *
   * @param attributes Attributes HashMap for the user. Can contain only String, char, int, long, float or double values
   */
  export function setAttributes(attributes: Attributes): Promise<void>;

  /**
   * Call this method to set custom attributes to the user.
   *
   * @param company  Company attributes map for the user. Can contain only String, char, int, long, float or double values and must contain the company id and name with keys 'company_id' and 'name'
   */
  export function setCompany(company: Company): Promise<void>;

  /**
   * Set to true or false to enable or disable the message receiving. It is ENABLED by default.
   *
   * A call to the method [.openSupport(Activity)] will force the enabling if it is disabled
   */
  export function setSupportEnabled(enabled: boolean): Promise<void>;

  /**
   * Returns true if the support is enabled, false otherwise
   */
  export function isSupportEnabled(): Promise<boolean>;

  /**
   * Set to true or false to enable or disable the message receiving. It is ENABLED by default.
   *
   * A call to the method [.openSupport(Activity)] will force the enabling if it is disabled
   */
  export function setSurveyEnabled(enabled: boolean): Promise<void>;

  /**
   * Returns true if the survey is enabled, false otherwise
   */
  export function isSurveyEnabled(): Promise<boolean>;

  /**
   * Call this method to keep track of custom labeled events.
   *
   * @param eventName The event custom label
   */
  export function trackEvent(eventName: string): Promise<void>;

  /**
   * Call this method to force a check for pending Surveys or Message for the current user.
   */
  export function update(): Promise<void>;

  /**
   * Set to true to enable error logging in the Console.
   *
   * Avoid to enable it in release app versions, the suggestion is to pass your.application.package.BuildConfig.DEBUG as set value
   */
  export function setVerboseLogging(enabled: boolean): Promise<void>;
}
