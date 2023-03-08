import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olz/authManager/auth_verify.dart';
import 'package:olz/authManager/authentication_manager.dart';
import 'package:olz/screens/Home.dart';
import 'package:olz/screens/Login.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  final AuthecticationManager _authManager = Get.put(AuthecticationManager());
  AuthecticationManager authManage = Get.find();

  Future<void> initializeSettings() async {
    _authManager.checkLoginStatus();

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return Obx(() {
              return _authManager.isLoggedIn.value
                  ? const Home()
                  : const Login();
            });
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/images/deal.png'),
            fit: BoxFit.contain,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('লোড হচ্ছে...'),
        ],
      ),
    ));
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'OLZ',
//               textScaleFactor: 1.3,
//               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Image(
//                 image: AssetImage('assets/images/deal.png'),
//                 fit: BoxFit.contain,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Material(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(25.0),
//                 child: InkWell(
//                   onTap: () =>
//                       Navigator.pushNamed(context, Routes.onboardRoute),
//                   child: Container(
//                     height: 50.0,
//                     width: 50.0,
//                     alignment: Alignment.center,
//                     child: const Icon(
//                       Icons.arrow_right,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
