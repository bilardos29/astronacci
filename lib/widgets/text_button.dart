import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({
    required this.label,
    this.textColor = Colors.black,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final String label;
  final Color textColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 12),
      ),
    );
  }
}
