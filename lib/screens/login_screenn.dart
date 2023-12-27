import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../helper/show_snackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_tex_field.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({  this.controller,
    super.key,
  });
   PageController ? controller;
  static String id = "LoginScreenn";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox.fromSize(
          size: MediaQuery.sizeOf(context),
          child: Stack(
            children: [
              Positioned(
                left: 80,
                top: 300,
                child: Transform.rotate(
                  angle: -pi * 0.05,
                  child: Image.asset(
                    'assets/images/chat_icon.png',
                    width: 50,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Image.asset(
                  'assets/images/chat_logo.png',
                  width: 100,
                ),
              ),
              Positioned(
                  // padding: const EdgeInsets.all(30),
                  bottom: 30,
                  left: 30,
                  right: 30,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhiteColor.withOpacity(.8),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Log In',
                            style: TextStyle(
                              color: kPrimaryHighContrast,
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormTextField(
                            obscureText: false,
                            onChange: (data) {
                              email = data;
                            },
                            hintText: "email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormTextField(
                            obscureText: true,
                            onChange: (data) {
                              password = data;
                            },
                            hintText: "password",
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomButton(
                            text: 'Login',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  await signInWithEmailAndPassword();
                                  if (!context.mounted) return;

                                  Navigator.pushNamed(context, ChatScreen.id,
                                      arguments: email);

                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    shwoSnackBar(context,
                                        "No user found for that email");
                                  } else if (e.code == 'wrong-password') {
                                    shwoSnackBar(context,
                                        "Wrong password provided for that user.");
                                  }
                                } catch (e) {
                                  shwoSnackBar(context, "There was an error");
                                }

                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                  color: kPrimaryDark,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 2.5,
                              ),
                              InkWell(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  widget.controller?.animateToPage(1,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: kPrimaryHighContrast,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }

  Future<void> signInWithEmailAndPassword() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
