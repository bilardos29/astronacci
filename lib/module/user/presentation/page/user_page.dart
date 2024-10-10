import 'package:astronacci/module/user/presentation/controller/user_controller.dart';
import 'package:astronacci/widgets/label_form.dart';
import 'package:astronacci/widgets/main_button.dart';
import 'package:astronacci/widgets/rounded_text_field.dart';
import 'package:astronacci/widgets/user_picture.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({required this.controller, Key? key}) : super(key: key);

  UserController controller;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late TextEditingController email = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController name = TextEditingController();

  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            UserPicture(image: '', editable: true, onClick: (){}),
            const SizedBox(height: 80),
            isEdit ? editForm() : const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelForm(label: 'Fullname', detail: 'Bilardo Situmorang'),
                LabelForm(label: 'Email', detail: 'bilardo@gmail.com'),
                LabelForm(label: 'Phone', detail: '082130427985'),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MainButton(
                      label: isEdit ? 'Update' : 'Edit',
                      bgColor: Colors.blue,
                      textColor: Colors.white,
                      onClick: () {
                        setState(() {
                          isEdit = !isEdit;
                        });
                      }),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget editForm(){
    return Column(
      children: [
        RoundedTextField(
          textController: name,
          hintText: 'Fullname',
          prefix: const Icon(Icons.people),
        ),
        const SizedBox(height: 10),
        RoundedTextField(
          textController: email,
          hintText: 'Email',
          obscureText: true,
          prefix: const Icon(Icons.email),
        ),
        const SizedBox(height: 10),
        RoundedTextField(
          textController: phone,
          hintText: 'Phone Number',
          obscureText: true,
          prefix: const Icon(Icons.phone),
        ),
      ],
    );
  }
}
