import 'package:astronacci/module/home/domain/model/user_model.dart';
import 'package:astronacci/widgets/user_picture.dart';
import 'package:flutter/material.dart';

class ListUserView extends StatelessWidget {
  const ListUserView({
    required this.user,
    Key? key,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Row(
        children: [
          UserPicture(
              image: user.profilePicture ?? '',
              pictureSize: PictureSize.small,
              onClick: () {}),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullname ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '${user.email}${user.email!.isEmpty || user.email!.isEmpty ? '' : ' | '}${user.phone}',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
