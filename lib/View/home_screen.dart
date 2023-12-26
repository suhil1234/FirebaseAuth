import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_books/View/widgets/sign_button.dart';
import 'package:my_books/core/app_style.dart';

import '../Controller/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/verification.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.white,), onPressed: () { Get.back(); },),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome!', style: h1Style.copyWith(color: Colors.white)),
                      SizedBox(height: 20.0),
                      SignButton(label: 'Logout', onPressed: () => _authController.logout())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}