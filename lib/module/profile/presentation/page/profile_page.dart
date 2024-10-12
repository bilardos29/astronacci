import 'package:astronacci/module/profile/presentation/controller/profile_controller.dart';
import 'package:astronacci/utils/config/route_config.dart';
import 'package:astronacci/widgets/label_form.dart';
import 'package:astronacci/widgets/main_button.dart';
import 'package:astronacci/widgets/rounded_text_field.dart';
import 'package:astronacci/widgets/text_button.dart';
import 'package:astronacci/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({required this.controller, Key? key}) : super(key: key);

  ProfileController controller;

  @override
  State<ProfilePage> createState() => _UserPageState();
}

class _UserPageState extends State<ProfilePage> {
  late TextEditingController email = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController name = TextEditingController();

  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Profile')),
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
                LabelForm(label: 'Phone', detail: '081121219090'),
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
                  const SizedBox(height: 20),
                  isEdit ? const SizedBox() : TextButtons(
                      label: 'Logout',
                      textColor: Colors.red,
                      onClick: () {
                        Get.offAllNamed(RouteConfig.login);
                      }),
                ],
              ),
            ),
            const SizedBox(height: 24),
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
