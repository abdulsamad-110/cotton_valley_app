import 'dart:convert';

import 'package:cotton_valley_app/ui/auth/sign_in/signin_view.dart';
import 'package:cotton_valley_app/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// import '../shared_prefrences/local_storage.dart';
// import '../utils/api_constants.dart';
import '../services/storage_services/local_storage_services.dart';
import '../utils/api_constants.dart';

import '../utils/app_colors.dart';
import '../utils/common_functions.dart';

class ApiClient {
  Future<dynamic> callApi({
    required String endpoint,
    required ApiRequestMethods method,
    Map<String, String>? queryParams,
    Map<String, String>? headers,
    Object? body,
    bool isTokenNeeded = true,
    bool isLoaderNeeded = false,
  }) {
    headers = headers ?? {};

    final url = Uri.http(ApiConstants.baseUrl, endpoint, queryParams);
    print("url ======> $url");
    print("Body ======> $body");
    String? encodedBody;
    if (method == ApiRequestMethods.post ||
        method == ApiRequestMethods.put ||
        method == ApiRequestMethods.patch) {
      encodedBody = jsonEncode(body ?? {});
    }
    headers['Content-Type'] = 'application/json';

    if (isTokenNeeded) {
      print(
          '${LocalStorage.getString(LocalStorageKeys.accessTokenKey)} =======> access');
      print(
          '${LocalStorage.getString(LocalStorageKeys.guestTokenKey)} =======> guest');
      if (LocalStorage.getString(LocalStorageKeys.accessTokenKey) == null) {
        final token = LocalStorage.getString(LocalStorageKeys.guestTokenKey);
        headers['Authorization'] = 'Token $token';
      } else if (LocalStorage.getString(LocalStorageKeys.accessTokenKey) !=
          null) {
        final token = LocalStorage.getString(LocalStorageKeys.accessTokenKey);
        headers['Authorization'] = 'Bearer $token';
      }
    }
    late Future<http.Response> response;
    switch (method) {
      case ApiRequestMethods.get:
        response = http.get(url, headers: headers);
        break;
      case ApiRequestMethods.post:
        response = http.post(url, headers: headers, body: encodedBody);
        break;
      case ApiRequestMethods.put:
        response = http.put(url, headers: headers, body: encodedBody);
        break;
      case ApiRequestMethods.patch:
        response = http.patch(url, headers: headers, body: encodedBody);
        break;
      case ApiRequestMethods.delete:
        response = http.delete(url, headers: headers);
        break;
      default:
        const Text('No such Case defined');
    }
    print('$response==========> see here');
    return handleResponse(
      response: response,
      endpoint: endpoint,
      isLoaderNeeded: isLoaderNeeded,
    );
  }

  Future<dynamic> handleResponse({
    required Future<http.Response> response,
    required bool isLoaderNeeded,
    required String endpoint,
  }) async {
    try {
      if (isLoaderNeeded) loader();

      final res = await response;
      if (isLoaderNeeded) Get.back();

      print("${res.body} =======> response");

      // Initialize decodedBody as null
      dynamic decodedBody;

      // Only decode the response body if it's not empty
      if (res.body.isNotEmpty) {
        try {
          decodedBody = jsonDecode(res.body);
        } catch (e) {
          print('Error decoding response: $e');
          errorDialog('Invalid JSON response from the server.');
          return null; // Exit early if JSON decoding fails
        }
      } else {
        print('Response body is empty');
      }

      // Check the status code for success
      if (res.statusCode >= 200 && res.statusCode < 300) {
        return decodedBody ?? {};
      } else {
        print('${res.statusCode} ===========> statsu codee');
        print('$endpoint =======? endpoint');
        if (res.statusCode == 401 && endpoint != ApiConstants.logInEndpoint) {
          LocalStorage.remove(LocalStorageKeys.accessTokenKey);
          Get.offAll(const SigninView());
          ScaffoldMessenger.of(Get.context!).showSnackBar(
              CommonFunctions.showMessage(
                  title: 'You need to Login again to continue.',
                  color: AppColors.redColor,
                  //message: '',
                   msg: ''));
          return;
        } else if (decodedBody != null && decodedBody is Map) {
          errorDialog(decodedBody["detail"].toString());
        } else if (decodedBody is List) {
        } else {
          errorDialog('An error occurred. Status code: ${res.statusCode}');
        }
      }
    } catch (e) {
      print('Error in api client catch ======> $e');
    }

    return null;
  }

  static Future<dynamic> loader() {
    return Get.dialog(const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        content: Center(
            child: CircularProgressIndicator(
          color: AppColors.redColor,
        ))));
  }

  Future<dynamic> errorDialog(String decodedBody) {
    return Get.dialog(AlertDialog(
      title: const Text("Errors"),
      content: Text(decodedBody),
    ));
  }
}

enum ApiRequestMethods { get, post, put, delete, patch }
