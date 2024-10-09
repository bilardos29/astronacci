import 'package:astronacci/module/forgot_password/presentation/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/main_button.dart';
import '../../../../widgets/rounded_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({required this.controller, Key? key})
      : super(key: key);

  ForgotPasswordController controller;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController emailController = TextEditingController();

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
            const SizedBox(height: 200),
            RoundedTextField(
              textController: emailController,
              hintText: 'Email',
              prefix: const Icon(Icons.email),
            ),
            const SizedBox(height: 20),
            MainButton(
                label: 'Submit',
                bgColor: Colors.blue,
                textColor: Colors.white,
                onClick: () {}),
          ],
        ),
      ),
    );
  }
}
