import 'package:flutter/material.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? prefixIcon, suffixIcon;
  final String hintText;
  const AppTextField({
    super.key,
    this.controller,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.7),
          fontSize: context.appWidth * .05,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.grey.withOpacity(.14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
