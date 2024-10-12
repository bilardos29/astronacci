import 'package:astronacci/module/home/presentation/controller/home_controller.dart';
import 'package:astronacci/utils/config/route_config.dart';
import 'package:astronacci/widgets/main_button.dart';
import 'package:astronacci/widgets/rounded_text_field.dart';
import 'package:astronacci/widgets/snack_bar.dart';
import 'package:astronacci/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  LoginController controller;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController email = TextEditingController();
  late TextEditingController pass = TextEditingController();

  bool hidePass = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.init();
  }

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
              textController: email,
              hintText: 'Email',
              prefix: const Icon(Icons.email),
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              textController: pass,
              hintText: 'Password',
              obscureText: hidePass,
              prefix: const Icon(Icons.lock),
              suffix: InkWell(
                  onTap: () {
                    setState(() {
                      hidePass = !hidePass;
                    });
                  },
                  child: Icon(hidePass
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined)),
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
                onClick: () async {
                  String msg =
                      await widget.controller.validate(email.text, pass.text);

                  msg.isEmpty
                      ? Get.offAllNamed(RouteConfig.home)
                      : SnackBarWidget.show(context, msg);
                }),
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
