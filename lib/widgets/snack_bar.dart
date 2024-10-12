import 'package:flutter/material.dart';

class SnackBarWidget {

  SnackBarWidget.show(BuildContext ctx, String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );

    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }


}
