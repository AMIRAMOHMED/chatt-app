import 'package:chatt_app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.text});

  String? text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: kPrimaryColor),
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            "$text",
            style: const TextStyle(color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}
