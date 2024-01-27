// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.text,
    this.onPressed,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  TextEditingController? controller;
  String? text;
  void Function()? onPressed;
  Widget? suffixIcon;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.yellow,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
    );
  }
}
