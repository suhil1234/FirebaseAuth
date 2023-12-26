import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_books/Controller/auth_controller.dart';
import 'package:my_books/View/login_screen.dart';
import 'View/signUp_screen.dart';
import 'firebase_options.dart';
import 'View/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Authentication',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      home: authController.isUserLoggedIn? HomeScreen(): SignUpScreen() ,
      getPages: [
        GetPage(name: '/', page: () => const SignUpScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}