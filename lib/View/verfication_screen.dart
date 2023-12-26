import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/auth_controller.dart';
import '../core/app_style.dart';
import 'login_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late AuthController authController;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    authController = Get.find<AuthController>();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      authController.checkEmailVerificationStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/verification.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                final emailVerified = authController.emailVerified.value;
                if (emailVerified == true) {
                  // Email is verified, navigate to the login screen
                  WidgetsBinding.instance?.addPostFrameCallback((_) {
                    Get.offAll(LoginScreen());
                  });
                }
                return Column(
                  children: [
                    Text(
                      'Please verify your email',
                      style: h2Style.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'A verification link has been sent to your email address. Please check your inbox and follow the instructions to complete the verification process.',
                      textAlign: TextAlign.center,
                      style: h3Style.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 25.0),
                    ElevatedButton(
                      onPressed: () {
                        authController.sendEmailVerification();
                      },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.8)),),
                      child: Text('Resend Verification Email',style: h3Style.copyWith(color: Colors.white),),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}