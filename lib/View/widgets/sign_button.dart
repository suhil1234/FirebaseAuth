import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/auth_controller.dart';
import '../../core/app_style.dart';
import '../home_screen.dart';

class SignButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SignButton({
    Key? key, required this.label, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.all(16),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.6)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          child: Text(
            label,
            style: h3Style.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}