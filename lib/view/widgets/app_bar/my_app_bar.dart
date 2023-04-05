import 'package:flutter/material.dart';

AppBar MyAppBar(GlobalKey<ScaffoldState> key, BuildContext context,
    {
    bool isDrawer = false,
    bool isProfile = false,
    bool isBack = false,
    int? index,
    Function()? onTapProfile,
    Function()? onTapBackButton,
    Widget? bottom,
    Color backgroundColor = Colors.transparent,
    String? title}) {
  return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: isBack
          ? BackButton(
              color: Colors.grey,
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
                fontSize: 30,
                  color: Colors.black, fontWeight: FontWeight.w700)));
}
