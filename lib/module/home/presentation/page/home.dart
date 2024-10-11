import 'package:astronacci/module/home/presentation/controller/home_controller.dart';
import 'package:astronacci/module/home/presentation/widget/list_user_view.dart';
import 'package:astronacci/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.controller}) : super(key: key);

  HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: RoundedTextField(
              textController: search,
              hintText: 'Search',
              obscureText: true,
              prefix: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            itemBuilder: (ctx, item) => const ListUserView(
              img: '',
              fullname: 'Bilardo Situmorang',
              email: 'bilardo.situmorang@gmail.com',
              phone: '082130427985',
            ),
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
