import 'package:flutter/material.dart';

import '../utils/colors.dart';

PreferredSizeWidget customAppBar(
  BuildContext context,
  String title,
) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: secondaryColor,
        )),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 25, fontWeight: FontWeight.w500, color: secondaryColor),
    ),
    backgroundColor: mobileBackgroundColor,
  );
}
