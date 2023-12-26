import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../View/home_screen.dart';
import '../View/login_screen.dart';
import '../View/verfication_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool emailVerified = false.obs;
  RxBool isKeyboardVisible =false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rxn<User> firebaseUser = Rxn<User>();

  User? get user => firebaseUser.value;
  bool get isUserLoggedIn => firebaseUser.value != null;

  @override
  void onInit() {
    super.onInit();

    firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> sendEmailVerification() async {
    try {
      await user?.sendEmailVerification();
      Get.snackbar(
        'Verification Email',
        'Verification email sent successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Verification Email Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  Future<void> checkEmailVerificationStatus() async {
    User? currentUser = _auth.currentUser;
    await currentUser?.reload();
    emailVerified.value = currentUser?.emailVerified == true;
  }

  Future<void> signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await user?.sendEmailVerification();
      Get.offAll(VerificationScreen());
    } catch (e) {
      Get.snackbar(
        'Sign Up Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        messageText: Text(
          e.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Future<void> login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.to(HomeScreen());
    } catch (e) {
      Get.snackbar(
        'Login Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(LoginScreen());
    } catch (e) {
      Get.snackbar(
        'Logout Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}