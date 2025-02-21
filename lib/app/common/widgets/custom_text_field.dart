import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? textInputType;
  final Icon? icon;
  final TextEditingController? controller;
  final bool? isPassword;

  const CustomTextField({
    super.key,
    this.hintText,
    this.textInputType,
    this.icon,
    this.controller,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        obscureText: isPassword ?? false,
        controller: controller,
        cursorColor: const Color(0xFF00623B),
        keyboardType: textInputType,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
