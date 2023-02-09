import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olz/authManager/authentication_manager.dart';
import 'package:olz/screens/Home.dart';
import 'package:olz/screens/Login.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthecticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLoggedIn.value ? const Home() : const Login();
    });
  }
}
