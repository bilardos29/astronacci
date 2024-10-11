import 'package:astronacci/utils/config/route_config.dart';
import 'package:astronacci/widgets/main_button.dart';
import 'package:astronacci/widgets/rounded_text_field.dart';
import 'package:astronacci/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.controller}) : super(key: key);

  LoginController controller;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Login',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ))
              ],
            ),
            const SizedBox(height: 40),
            RoundedTextField(
              textController: emailController,
              hintText: 'Email',
              prefix: const Icon(Icons.email),
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              textController: passController,
              hintText: 'Password',
              obscureText: true,
              prefix: const Icon(Icons.lock),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtons(
                    label: 'Forgot Password',
                    textColor: Colors.blue,
                    onClick: () {
                      Get.toNamed(RouteConfig.forgotpassword);
                    }),
              ],
            ),
            const SizedBox(height: 20),
            MainButton(
                label: 'Login',
                bgColor: Colors.blue,
                textColor: Colors.white,
                onClick: () {}),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButtons(label: 'Don\'t have account? ', onClick: () {}),
                TextButtons(
                    label: 'Register',
                    textColor: Colors.blue,
                    onClick: () {
                      Get.toNamed(RouteConfig.register);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
