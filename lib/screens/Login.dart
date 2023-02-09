import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olz/controller/Login/loginController.dart';
import 'package:olz/widget/ButtonWidget.dart';
import 'package:olz/widget/TextWidget.dart';

import '../utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController loginController = Get.put(LoginController());

  String username = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  checkLogin(BuildContext context) async {
    print(_formKey.currentState!.validate());
    if (_formKey.currentState!.validate()) {
      // setState(() {
      //   // changeButton = true;
      // });
      // await Future.delayed(const Duration(seconds: 1));
      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
      // setState(() {
      //   changeButton = false;
      // });
      loginController.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                height: 250.0,
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 108.0),
                    child: Text(
                      'Login',
                      textScaleFactor: 2.0,
                      style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: 20,
                          // color: Color(0xFF16C3C9),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              TextWidget(
                  height: 45,
                  width: 300,
                  color: Colors.purple,
                  borderColor: Colors.grey,
                  placeholder: 'Username',
                  textEditingController: loginController.emailController,
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    // loginController.validateEmail(value);
                    if (value!.isEmpty) {
                      return 'UID is required';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (data) {
                    // print(StackTrace.current.toString());
                    // debugPrintStack(label: 'Login Data', maxFrames: 2);
                    // print(data);
                    username = data;
                    setState(() {});
                  },
                  onSaved: (value) {
                    // loginController.username = value;
                  }),
              TextWidget(
                  height: 45,
                  width: 300,
                  color: Colors.purple,
                  borderColor: Colors.grey,
                  placeholder: 'Password',
                  obsecureText: true,
                  showPasswordEye: true,
                  prefixIcon: const Icon(Icons.lock),
                  validator: (value) {
                    // loginController.validatePassword(value);
                    if (value!.isEmpty) {
                      return 'Password is required';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (data) {
                    print(data);
                    password = data;
                    setState(() {});
                  },
                  textEditingController: loginController.passwordController,
                  onSaved: (value) {
                    loginController.password = value;
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, right: 10.0),
                child: InkWell(
                  onTap: () => print('Logging...'),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: const Text('Forgot Password'),
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: InkWell(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: GoogleFonts.lato().fontFamily,
                            color: Colors.deepPurple),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Obx(
                      () => loginController.isLoading.value == false
                          ? InkWell(
                              onTap: () => {checkLogin(context)},
                              child: const Icon(
                                Icons.arrow_circle_right,
                                color: Colors.blue,
                                size: 60.0,
                              ),
                            )
                          : CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 // Get.snackbar(
                      //     'Invalid cred', 'Please enter a valid cred',
                          // snackPosition: SnackPosition.BOTTOM,
                          // titleText: Text(
                          //   'Invalid cred',
                          //   textScaleFactor: 1.2,
                          //   style: TextStyle(
                          //       fontFamily: GoogleFonts.lato().fontFamily,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.white),
                          // ),
                          // messageText: Text(
                          //   'Please enter a valid cred',
                          //   style: TextStyle(
                          //       fontFamily: GoogleFonts.lato().fontFamily,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.white),
                          // ),
                      //     colorText: Colors.red,
                      //     backgroundColor: Colors.deepPurple),
                      // Get.defaultDialog(
                      //     title: 'Error',
                      //     middleText: 'You have entered wrong credentials')
                      // Navigator.pushNamed(context, Routes.homeRoute)