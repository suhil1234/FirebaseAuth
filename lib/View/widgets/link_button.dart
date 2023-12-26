import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_style.dart';
import '../login_screen.dart';

class LinkButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const LinkButton({
    super.key, required this.label, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        child: Text(label ,style: h4Style.copyWith(color: Colors.white),),
        style : ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent,)));
  }
}