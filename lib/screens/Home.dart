import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:olz/authManager/authentication_manager.dart';
import 'package:olz/controller/Login/loginController.dart';
import 'package:olz/controller/Product/productController.dart';
import 'package:olz/models/product/productModel.dart';
import 'package:olz/models/user/user_detail_model.dart';
import 'package:olz/widget/ProductListWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProductController productController = Get.put(ProductController());
  final LoginController loginController = Get.put(LoginController());

  // print(loginController.loginData);

  AuthecticationManager _authManager = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UserDetails.userName),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.power_off,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              _authManager.logout();
            },
          )
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) =>
                  ItemWidget(item: productController.productList[index]),
            ),
          );
        }
      }),
    );
  }
}
