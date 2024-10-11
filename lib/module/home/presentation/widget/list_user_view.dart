import 'package:astronacci/widgets/user_picture.dart';
import 'package:flutter/material.dart';

class ListUserView extends StatelessWidget {
  const ListUserView({
    required this.img,
    required this.fullname,
    required this.email,
    required this.phone,
    Key? key,
  }) : super(key: key);

  final String img;
  final String fullname;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          UserPicture(
              image: img, pictureSize: PictureSize.small, onClick: () {}),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '$email${email.isEmpty || phone.isEmpty ? '' : ' | '}$phone',
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
