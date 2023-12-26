import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_books/Controller/auth_controller.dart';
import '../../core/app_style.dart';
import '../home_screen.dart';

class EmailField extends StatefulWidget {


  const EmailField({Key? key}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();


}



class _EmailFieldState extends State<EmailField> {
  final AuthController authController = Get.find<AuthController>();
  final FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      authController.isKeyboardVisible.value = emailFocusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10) ,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(25.0),
          color: Colors.black.withOpacity(0.6),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: emailFocusNode,
                onChanged: (value) {
                  authController.emailController.text = value;
                },
                controller: authController.emailController ,
                style: h3Style.copyWith(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: h3Style.copyWith(color: Colors.white),
                  hintText: 'Enter your email',
                  hintStyle: h3Style.copyWith(color: Colors.white),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 8,right: 16),
                ),
              ),
            ),
            Icon(
              Icons.email,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}