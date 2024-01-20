declare module "react-native-customerly" {
  export function openSupport(): Promise<void>;
  export function registerUser(
    email: string,
    userId?: string,
    name?: string,
    attributes?: { [key: string]: any },
    company?: { [key: string]: any }
  ): Promise<void>;
  export function logoutUser(): Promise<void>;
  export function isSdkAvailable(): Promise<void>;
}
