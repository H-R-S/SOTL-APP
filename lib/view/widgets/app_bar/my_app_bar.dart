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
    String? title,
    Widget? actionData}) {
  return AppBar(
      leadingWidth: isBack ? 40 : 80,
      // toolbarHeight: 75,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      // actionButton != null ? false : isCenter,
      actions: <Widget>[
        actionData ?? const SizedBox(width: 0.0, height: 0.0),
      ],
      leading: isBack
          ? BackButton(
              color: Styles.fontColor,
              onPressed: onTapBackButton ?? () => Navigator.pop(context))
          : Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Image.asset(
                "assets/logos/iqra_logo.png",
                width: 60,
                height: 60,
              ),
            ),
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(40), child: bottom)
          : null,
      title: title != null
          ? FittedBox(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Styles.fontColor,
                      fontWeight: FontWeight.w600)))
          : null);
}
