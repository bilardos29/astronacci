import 'package:astronacci/module/home/presentation/controller/home_controller.dart';
import 'package:astronacci/module/home/presentation/widget/list_user_view.dart';
import 'package:astronacci/utils/config/route_config.dart';
import 'package:astronacci/widgets/rounded_text_field.dart';
import 'package:astronacci/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetBuilder(
        init: widget.controller,
        builder: (controller) => Scaffold(
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UserPicture(
                            image: '',
                            pictureSize: PictureSize.small,
                            onClick: () {
                              Get.toNamed(RouteConfig.profile);
                            }),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text('Bilardo ',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: RoundedTextField(
                      textController: search,
                      hintText: 'Search',
                      prefix: const Icon(Icons.search),
                      onChanged: (val){
                        controller.searchUser(val);
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    itemBuilder: (ctx, item) {
                      return ListUserView(
                        user: search.text.isEmpty
                            ? controller.listUser[item]
                            : controller.listUserSearch[item],
                      );
                    },
                    itemCount: search.text.isEmpty
                        ? controller.listUser.length
                        : controller.listUserSearch.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ],
              ),
            ));
  }
}
