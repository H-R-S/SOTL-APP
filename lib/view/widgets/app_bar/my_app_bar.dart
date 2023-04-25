import 'package:flutter/material.dart';
import 'package:sotl/resources/constants/style.dart';

AppBar MyAppBar(GlobalKey<ScaffoldState> key, BuildContext context,
    {bool isDrawer = false,
    bool isProfile = false,
    bool isBack = false,
    int? index,
    Function()? onTapProfile,
    Function()? onTapBackButton,
    Widget? bottom,
    Color backButtonColor = Colors.grey,
    Color backgroundColor = primary,
    String? title}) {
  return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: isBack
          ? BackButton(
              color: backButtonColor,
              onPressed: onTapBackButton ??
                  () {
                    Navigator.pop(context);
                  })
          : null,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(75), child: bottom)
          : null,
      title: Text(title ?? "",
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.normal)));
}
