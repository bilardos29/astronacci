import 'package:flutter/material.dart';

class LabelForm extends StatelessWidget {
  const LabelForm({
    required this.label,
    required this.detail,
    Key? key,
  }) : super(key: key);

  final String label;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(context, label, 10),
          const SizedBox(height: 2),
          text(context, detail, 18),
          const SizedBox(height: 4),
          const Divider(height: 1),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget text(BuildContext context, String txt, double size, {Color color = Colors.black}) {
    return Text(txt, style: Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: size,
    ));
  }
}
