import 'package:chatt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {required this.hintText, this.obscureText, this.onChange, super.key});
  Function(String)? onChange;
  String? hintText;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return "please enter valid data";
          }
        },
        style: const TextStyle(
            color: kDarkGrey, fontSize: 13, fontWeight: FontWeight.w400),
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kPrimaryHighContrast, fontSize: 15),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDark)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)),
        ));
  }
}
