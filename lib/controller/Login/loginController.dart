import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olz/authManager/authentication_manager.dart';
import 'package:olz/models/user/user_detail_model.dart';
import 'package:olz/screens/Home.dart';
import 'package:olz/utils/apiTemplate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  // TextEditingController username ='username';
  // TextEditingController password;
  var isLoading = false.obs;
  var isDatareadingCompleted = false.obs;
  late final AuthecticationManager _authecticationManager;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final formState = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  var username = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _authecticationManager = Get.find();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  validateEmail(String value) {
    if (value == '') {
      return 'Please enter a valid UID';
      // return Get.snackbar('Error', 'Please enter a valid ID',
      //     snackPosition: SnackPosition.BOTTOM,
      //     titleText: Text(
      //       'UID',
      //       textScaleFactor: 1.2,
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.lato().fontFamily,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white),
      //     ),
      //     messageText: Text(
      //       'Please enter a valid UID',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.lato().fontFamily,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white),
      //     ),
      //     backgroundColor: Colors.deepPurple);
    }
  }

  validatePassword(String value) {
    if (value == '') {
      return 'Please enter password';
      // return Get.snackbar('Error', 'Please enter a valid ID',
      //     snackPosition: SnackPosition.BOTTOM,
      //     titleText: Text(
      //       'Password',
      //       textScaleFactor: 1.2,
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.lato().fontFamily,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white),
      //     ),
      //     messageText: Text(
      //       'Please enter password',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.lato().fontFamily,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white),
      //     ),
      //     backgroundColor: Colors.deepPurple);

    } else if (value.length < 8) {
      // return Get.snackbar('Error', 'Please enter a valid ID',
      //     snackPosition: SnackPosition.BOTTOM,
      //     titleText: Text(
      //       'Password',
      //       textScaleFactor: 1.2,
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.lato().fontFamily,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white),
      //     ),
      //     messageText: Text(
      //       'Password must not be less than 8 character',
      //       style: TextStyle(
      //           fontFamily: GoogleFonts.lato().fontFamily,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white),
      //     ),
      //     backgroundColor: Colors.deepPurple);
      return 'Password must not be less than 8 character';
    }
  }

  void checkLogin() {
    final isValid = formState.currentState!.validate();

    print(isValid);

    // if (!isValid) {
    //   print('Is ite validated?');
    //   return;
    // }
    // formState.currentState!.save();
    // print('Is ite validated?');

    if (isValid) {
      login();
    }
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.base_url + ApiEndpoints.authEndpoints.loginUrl);

      Map body = {
        'opportunity_id': emailController.text,
        'password': passwordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        isLoading.value = false;
        Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['status'] == true) {
          UserDetails.userName = responseData['data']['name'];
        }
        var token = responseData['token'];

        _authecticationManager.login(token);

        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        Get.off(() => const Home());
        emailController.clear();
        passwordController.clear();
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Something is wrong please try again');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      isLoading.value = false;

      Get.snackbar('Error', 'Something is wrong please try again');
    }
  }
}
