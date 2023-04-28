import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

AppBar MyAppBar(GlobalKey<ScaffoldState> key, BuildContext context,
    {bool isDrawer = false,
    bool isProfile = false,
    bool isBack = false,
    bool isCenter = true,
    int? index,
    IconData? actionButton,
    Function()? onTapAction,
    Function()? onTapProfile,
    Function()? onTapBackButton,
    Widget? bottom,
    Color backButtonColor = Colors.grey,
    Color backgroundColor = primary,
    String? title}) {
  return AppBar(
      leadingWidth: 30,
      toolbarHeight: 75,
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: actionButton != null ? false : isCenter,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: onTapAction,
                icon: Icon(actionButton, size: 30, color: Colors.white)))
      ],
      leading: isBack
          ? BackButton(
              color: Colors.white,
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
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500)));
}
