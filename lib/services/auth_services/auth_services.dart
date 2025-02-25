// import 'package:google_sign_in/google_sign_in.dart';
import '../../api_client/api_client.dart';
import '../../utils/api_constants.dart';
import '../../utils/common_functions.dart';
import '../storage_services/local_storage_services.dart';

class AuthServices {
  static final ApiClient _apiClient = ApiClient();

// ///// Forget Password Api
//   static Future? forgetPasswordRequest({required String email}) async {
//     final response = await _apiClient.callApi(
//         endpoint: ApiConstants.forgetPassEndpoint,
//         isLoaderNeeded: true,
//         isTokenNeeded: false,
//         method: ApiRequestMethods.post,
//         body: {
//           'email': email,
//         });
//     if (response != null) {
//       LocalStorage.setString(
//           LocalStorageKeys.accessTokenKey, response['access']);
//       return response;
//     }
//     return null;
//   }

///// Login Api
  static Future? logInRequest(
      {required String email, required String password}) async {
    final response = await _apiClient.callApi(
        endpoint: ApiConstants.logInEndpoint,
        isLoaderNeeded: true,
        isTokenNeeded: false,
        method: ApiRequestMethods.post,
        body: {'email': email, 'password': password});
    if (response != null) {
      // LocalStorage.remove(LocalStorageKeys.guestTokenKey);
      LocalStorage.setString(
          LocalStorageKeys.accessTokenKey, response['data']['access_token']);
      LocalStorage.setString(
          LocalStorageKeys.refreshTokenKey, response['data']['refresh_token']);
      //CommonFunctions.getCurrentCity();
      return response;
    }
    return null;
  }

  ///// Logout Api
  static Future<bool?> logOutRequest() async {
    final response = await _apiClient.callApi(
        endpoint: ApiConstants.logOutEndpoint,
        method: ApiRequestMethods.post,
        body: {
          'refresh': LocalStorage.getString(LocalStorageKeys.refreshTokenKey)
        },
        isLoaderNeeded: true);
    if (response != null) {
      LocalStorage.remove(LocalStorageKeys.accessTokenKey);
      LocalStorage.remove(LocalStorageKeys.refreshTokenKey);
      return true;
    }
    return null;
  }

  ///// Sign Up Post Api
  static Future signupRequest({
    required String name,
    required String companyName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await _apiClient.callApi(
        endpoint: ApiConstants.signUpEndpoint,
        isLoaderNeeded: true,
        isTokenNeeded: false,
        method: ApiRequestMethods.post,
        body: {
          'name': name,
          'fullName': companyName,
          'email': email,
          'password': password,
          'password2': confirmPassword,
        });
    if (response != null) {
      return response;
    }
    return null;
  }

  ///// Forget password Post Api
  static Future? forgetPass({required String email}) async {
    final response = await _apiClient.callApi(
        endpoint: ApiConstants.forgetPassEndpoint,
        isLoaderNeeded: true,
        isTokenNeeded: false,
        method: ApiRequestMethods.post,
        body: {'email': email});
    if (response != null) {
      return response;
    }
    return null;
  }

  ///// OTP verifiy Post Api
  static Future? otpVerify(
      {required String email,
      required int otp,

      bool fromForgetPassword = true}) async {
    final response = await _apiClient.callApi(
        endpoint: ApiConstants.otpverifyEndpoint,
        isLoaderNeeded: true,
        isTokenNeeded: false,
        method: ApiRequestMethods.post,
        body: {"email": email, "otp": otp});
    if (response != null) {
      print('here 1');
      if (!fromForgetPassword) {
        LocalStorage.remove(LocalStorageKeys.guestTokenKey);
        LocalStorage.setString(
            LocalStorageKeys.accessTokenKey, response['token']['access']);
        LocalStorage.setString(
            LocalStorageKeys.refreshTokenKey, response['token']['refresh']);
      }
      return response;
    }
    return null;
  }

  ///// Change password Post Api
  static Future changePass(
      {required String password,
      required String access,
      required String password2}) async {
    final response = await _apiClient.callApi(
        endpoint: ApiConstants.changePassEndpoint,
        isLoaderNeeded: true,
        method: ApiRequestMethods.post,
        isTokenNeeded: false,
        headers: {"Authorization": "Bearer $access"},
        body: {'password': password});
    if (response != null) {
      return response;
    }
    return null;
  }
}
