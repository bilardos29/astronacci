import 'package:astronacci/module/auth/presentation/controller/register_controller.dart';
import 'package:astronacci/widgets/main_button.dart';
import 'package:astronacci/widgets/rounded_text_field.dart';
import 'package:astronacci/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({required this.controller, Key? key}) : super(key: key);

  RegisterController controller;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController email = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController pass = TextEditingController();
  late TextEditingController name = TextEditingController();
  late TextEditingController repass = TextEditingController();

  bool hidePass = true;
  bool hideRePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Register',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ))
              ],
            ),
            const SizedBox(height: 40),
            RoundedTextField(
              textController: name,
              hintText: 'Fullname',
              prefix: const Icon(Icons.people),
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              textController: email,
              hintText: 'Email',
              prefix: const Icon(Icons.email),
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              textController: phone,
              hintText: 'Phone',
              prefix: const Icon(Icons.phone),
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
                        : Icons.remove_red_eye_outlined))),
            const SizedBox(height: 10),
            RoundedTextField(
                textController: repass,
                hintText: 'Re-Password',
                obscureText: hideRePass,
                prefix: const Icon(Icons.lock),
                suffix: InkWell(
                    onTap: () {
                      setState(() {
                        hideRePass = !hideRePass;
                      });
                    },
                    child: Icon(hideRePass
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined))),
            const SizedBox(height: 20),
            MainButton(
                label: 'Register',
                bgColor: Colors.blue,
                textColor: Colors.white,
                onClick: () async {
                  String msg = await widget.controller.validate(email.text, name.text, phone.text,
                      pass.text, repass.text);
                  if(msg.isEmpty) {
                    Get.back();
                  } else {
                    SnackBarWidget.show(context, msg);
                  }

                }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
