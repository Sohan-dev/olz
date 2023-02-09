import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:olz/screens/Home.dart';
import 'package:olz/screens/Login.dart';
import 'package:olz/screens/Onboarding.dart';
import 'package:olz/screens/Splash.dart';
import 'package:olz/utils/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Splash(),
        Routes.loginRoute: ((context) => const Login()),
        Routes.onboardRoute: ((context) => const Onboard()),
        Routes.homeRoute: ((context) => const Home()),
      },
      // onUnknownRoute: (settings) => ,
    );
  }
}
