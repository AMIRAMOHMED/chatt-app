import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../helper/show_snackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_tex_field.dart';
import 'chat_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({
    this.controller,
    super.key,
  });

  PageController? controller;
  static String id = "registerScreenn";

  @override
  State<RegisterScreen> createState() => _LoginScreennState();
}

class _LoginScreennState extends State<RegisterScreen> {
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
                right: 100,
                top:120,
                child: Image.asset(
                  'assets/images/people_chatting.jpg',
                  width: 220,
                ),
              ),
              Positioned(
                right: 100,
                bottom: 30,
                child: Transform.rotate(
                  angle: -pi * 0.04,
                  child: Image.asset(
                    'assets/images/live_chat.png',
                    width: 200,
                  ),
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
                            'Sign up',
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
                            text: 'Register',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  await registrationWithEmailAndPassword;
                                  if (!context.mounted) return;

                                  Navigator.pushNamed(context, ChatScreen.id,
                                      arguments: email);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    shwoSnackBar(context,
                                        'The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    shwoSnackBar(context,
                                        'The account already exists for that email.');
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
                                  widget.controller?.animateToPage(0,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                                child: const Text(
                                  'Log In',
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

  Future<void> registrationWithEmailAndPassword() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "barry.allen@example.com", password: "SuperSecretPassword!");
  }
}
