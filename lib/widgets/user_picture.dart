import 'package:flutter/material.dart';

enum PictureSize { big, small }

class UserPicture extends StatelessWidget {
  const UserPicture({
    required this.image,
    this.bgColor = Colors.white,
    this.pictureSize = PictureSize.big,
    this.editable = false,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final String image;
  final Color bgColor;
  final bool editable;
  final PictureSize pictureSize;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    double imgSize = pictureSize == PictureSize.big ? 100 : 40;
    return InkWell(
      onTap: onClick,
      child: Stack(
        children: [
          Container(
            height: imgSize,
            width: imgSize,
            padding: EdgeInsets.all(pictureSize == PictureSize.big ? 8 : 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(imgSize),
              border: Border.all(width: 1, color: Colors.black26),
              color: bgColor,
            ),
            child: Center(
                child: image.isEmpty
                    ? Icon(Icons.person_outline, size: imgSize/1.5)
                    : Image.network(image)),
          ),
          editable ? Positioned(
              bottom: 2,
              right: 2,
              child: editButton()) : const SizedBox(),
        ],
      ),
    );
  }

  Widget editButton() {
    return Container(
      height: 32,
      width: 32,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white, width: 1),
        color: Colors.white,
      ),
      child: const Icon(Icons.edit, size: 20),
    );
  }
}
