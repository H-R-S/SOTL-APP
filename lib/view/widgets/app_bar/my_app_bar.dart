import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

// ignore: non_constant_identifier_names
AppBar MyAppBar(GlobalKey<ScaffoldState> key, BuildContext context,
    {bool isDrawer = false,
    bool isProfile = false,
    bool isBack = false,
    bool isCenter = true,
    int? index,
    Function()? onTapAction,
    Function()? onTapProfile,
    Function()? onTapBackButton,
    Widget? bottom,
    Color backButtonColor = Colors.grey,
    Color backgroundColor = primary,
    String? title,
    bool isActionButtonCircle = true,
    IconData? actionIcon}) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  bool isDark = themeProvider.currentTheme == ThemeData.dark();

  return AppBar(
      scrolledUnderElevation: 0,
      leadingWidth: isBack ? 40 : 80,
      elevation: 0,
      backgroundColor: isDark ? dark : Colors.transparent,
      centerTitle: true,
      actions: actionIcon != null
          ? [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: onTapAction,
                    child: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            isActionButtonCircle ? primary : Colors.transparent,
                        child: Icon(actionIcon,
                            size: 30,
                            color:
                                isActionButtonCircle ? Colors.white : primary)),
                  ))
            ]
          : null,
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
