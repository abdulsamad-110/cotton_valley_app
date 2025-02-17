// // import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:namaz_app/api_client/api_client.dart';
// import 'package:namaz_app/services/storage_services/local_storage_services.dart';
// import 'package:namaz_app/utils/api_constants.dart';
// import 'package:namaz_app/utils/common_functions.dart';

// class AuthServices {
//   static final ApiClient _apiClient = ApiClient();

// ////////////////Forget Password Api///////////////////
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

// ////////////////Login Api///////////////////
//   static Future? logInRequest(
//       {required String email, required String password}) async {
//     final response = await _apiClient.callApi(
//         endpoint: ApiConstants.logInEndpoint,
//         isLoaderNeeded: true,
//         isTokenNeeded: false,
//         method: ApiRequestMethods.post,
//         body: {'email': email, 'password': password});
//     if (response != null) {
//       LocalStorage.remove(LocalStorageKeys.guestTokenKey);
//       LocalStorage.setString(
//           LocalStorageKeys.accessTokenKey, response['access']);
//       LocalStorage.setString(
//           LocalStorageKeys.refreshTokenKey, response['refresh']);
//       CommonFunctions.getCurrentCity();
//       return response;
//     }
//     return null;
//   }

//   ////////////////////Google Api////////////////////

//   // static Future<bool?> signInWithGoogle() async {
//   //       print("1");
//   //   final GoogleSignIn _googleSignIn = GoogleSignIn(
//   //     scopes: [
//   //       // 'openid',
//   //       'email', // Required for ID token
//   //       'profile', // Provides access to user information
//   //     ],
//   //     // clientId:
//   //     //     '308093272806-elume4mdp362u51vdh9itdgifpgajgd1.apps.googleusercontent.com',
//   //   );
//   //       print("2");
//   //   try {
//   //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//   //     if (googleUser == null) {
//   //
//   //       print("3");
//   //       return false;
//   //     }
//   //
//   //     print("User signed in: ${googleUser.displayName}");
//   //
//   //       print("4");
//   //     final GoogleSignInAuthentication googleAuth =
//   //         await googleUser.authentication;
//   //
//   //     // Log the tokens to debug
//   //     print("Email: ${googleUser.email}");
//   //     print("Display Name: ${googleUser.displayName}");
//   //
//   //     print("Access token: ${googleAuth.accessToken}");
//   //     print("ID token: ${googleAuth.idToken}");
//   //
//   //     String? token = googleAuth.idToken;
//   //     if (token == null) {
//   //       print("5");
//   //
//   //       return false;
//   //     }
//   //     print("6");
//   //     final response = await _apiClient.callApi(
//   //       endpoint: ApiConstants.googleLogInEndpoint,
//   //       isLoaderNeeded: true,
//   //       isTokenNeeded: false,
//   //       method: ApiRequestMethods.post,
//   //       body: {'id-token': token},
//   //     );
//   //
//   //     if (response != null) {
//   //       LocalStorage.setString(LocalStorageKeys.accessTokenKey, response['access']);
//   //       LocalStorage.setString(LocalStorageKeys.accessTokenKey, response['refresh']);
//   //       return true;
//   //     }
//   //     return false;
//   //   } catch (e) {
//   //     print("Error during Google Sign-In: $e");
//   //     return false;
//   //   }
//   // }

//   static Future? signInWithGoogle() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     // await googleSignIn.signOut();
//     // print('here');
//     // return;
//     // final GoogleSignInAccount? googleSignInAccount =
//     //     await googleSignIn.signIn();
//     // final GoogleSignInAuthentication googleSignInAuthentication =
//     //     await googleSignInAccount!.authentication;
//     // print('${googleSignInAuthentication.idToken} ===========? id token');
//     try {
//       const List<String> scopes = <String>[
//         'email',
//         'https://www.googleapis.com/auth/contacts.readonly',
//       ];

//       GoogleSignIn _googleSignIn = GoogleSignIn(
//           // Optional clientId
//           // clientId: 'your-client_id.apps.googleusercontent.com',
//           // scopes: scopes,
//           );
//       var account = await _googleSignIn.signIn();

//       var auth = await account!.authentication;

//       final response = await _apiClient.callApi(
//           endpoint: ApiConstants.googleLogInEndpoint,
//           method: ApiRequestMethods.post,
//           body: {'id_token': auth.idToken},
//           isLoaderNeeded: true);
//       print('my id ======> ${auth.idToken}');
//       print('my response ======> $response');
//       return response;
//     } catch (e) {
//       print('Error in catch $e');
//     }
//   }

//   // //// ////// //////// Logout Api //////// ////// //// //
//   static Future<bool?> logOutRequest() async {
//     final response = await _apiClient.callApi(
//         endpoint: ApiConstants.logOutEndpoint,
//         method: ApiRequestMethods.post,
//         body: {
//           'refresh': LocalStorage.getString(LocalStorageKeys.refreshTokenKey)
//         },
//         isLoaderNeeded: true);
//     if (response != null) {
//       LocalStorage.remove(LocalStorageKeys.accessTokenKey);
//       LocalStorage.remove(LocalStorageKeys.refreshTokenKey);
//       return true;
//     }
//     return null;
//   }

//   // //// ////// //////// Sign Up Post Api //////// ////// //// //
//   static Future signupRequest({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     final response = await _apiClient.callApi(
//         endpoint: ApiConstants.signUpEndpoint,
//         isLoaderNeeded: true,
//         isTokenNeeded: false,
//         method: ApiRequestMethods.post,
//         body: {
//           'name': name,
//           'email': email,
//           'password': password,
//         });
//     if (response != null) {
//       return response;
//     }
//     return null;
//   }

//   //////////////////// GuestLogin Post Api ////////////////////
//   static Future guestLogin() async {
//     final response = await _apiClient.callApi(
//         endpoint: ApiConstants.guestLoginEndpoint,
//         isLoaderNeeded: true,
//         isTokenNeeded: false,
//         method: ApiRequestMethods.post
//         //body: {}
//         );
//     if (response != null) {
//       LocalStorage.setString(
//           LocalStorageKeys.guestTokenKey, response['data']['token']);
//       return response;
//     }
//     return null;
//   }

//   // //// ////// //////// Forget password Post Api //////// ////// //// //
//   static Future? forgetPass({required String email}) async {
//     final response = await _apiClient.callApi(
//         endpoint: ApiConstants.forgetPassEndpoint,
//         isLoaderNeeded: true,
//         isTokenNeeded: false,
//         method: ApiRequestMethods.post,
//         body: {'email': email});
//     if (response != null) {
//       // LocalStorage.setString(
//       //     LocalStorageKeys.accessTokenKey, response['status']);
//       return response;
//     }
//     return null;
//   }

//   // //// ////// //////// Change password Post Api //////// ////// //// //
//   static Future changePass({required String password}) async {
//     final response = await _apiClient.callApi(
//         endpoint: ApiConstants.changePassEndpoint,
//         isLoaderNeeded: true,
//         isTokenNeeded: false,
//         method: ApiRequestMethods.post,
//         body: {'password': password});
//     if (response != null) {
//       return response;
//     }
//     return null;
//   }

//   // //// ////// //////// OTP verifiy Post Api //////// ////// //// //
//   static Future? otpVerify({required String email, required int otp}) async {
//     final response = await _apiClient.callApi(
//         endpoint: ApiConstants.otpverifyEndpoint,
//         isLoaderNeeded: true,
//         isTokenNeeded: false,
//         method: ApiRequestMethods.post,
//         body: {"email": email, "otp": otp});
//     if (response != null) {
//       print('here 1');

//       return response;
//     }
//     return null;
//   }
// }
