import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.label,
    required this.bgColor,
    required this.textColor,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final String label;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: bgColor,
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 14),
        )),
      ),
    );
  }
}
