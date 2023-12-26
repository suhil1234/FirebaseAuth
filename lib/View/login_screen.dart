import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_books/View/login_screen.dart';
import 'package:my_books/View/signUp_screen.dart';
import 'package:my_books/View/widgets/email_field.dart';
import 'package:my_books/View/widgets/password_field.dart';
import 'package:my_books/View/widgets/sign_button.dart';

import '../Controller/auth_controller.dart';
import '../core/app_style.dart';
import 'home_screen.dart';
import 'widgets/link_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/verification.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "My Books",
                  style: h1Style.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "Login",
                  style: h2Style.copyWith(color: Colors.white),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Obx(() {
                          return SizedBox(
                            height: authController.isKeyboardVisible.value ? 50 : 200,
                          );
                        }),
                        EmailField(),
                        const SizedBox(height: 20),
                        PasswordField(),
                        const SizedBox(height: 30),
                        SignButton(
                          label: 'Login',
                          onPressed: () {
                            authController.login();
                          },
                        ),
                        const SizedBox(height: 20),
                        LinkButton(
                          label: 'Create New Account',
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}