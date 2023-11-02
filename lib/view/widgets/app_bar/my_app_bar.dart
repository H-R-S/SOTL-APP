import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sotl/resources/constants/icons.dart';
import 'package:sotl/resources/constants/style.dart';
import 'package:sotl/theme/theme.dart';
import 'package:sotl/theme/theme_provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int? index;
  final double height;
  final bool isDrawer, isProfile, isBack, isCenter, isActionButtonCircle;
  final Function()? onTapAction, onTapProfile, onTapBackButton;
  final Widget? bottom;
  final Color backButtonColor;
  final Color backgroundColor;
  final String? title;
  final IconData? actionIcon;

  const MyAppBar(
      {super.key,
      this.isDrawer = false,
      this.isProfile = false,
      this.isBack = false,
      this.isCenter = true,
      this.height = 56,
      this.isActionButtonCircle = true,
      this.index,
      this.onTapAction,
      this.onTapProfile,
      this.onTapBackButton,
      this.bottom,
      this.backButtonColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.title,
      this.actionIcon});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return AppBar(
        scrolledUnderElevation: 0,
        leadingWidth: isBack ? 40 : 80,
        elevation: 0,
        backgroundColor: isDark ? dark : Colors.white,
        centerTitle: isCenter,
        actions: actionIcon != null
            ? [
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: onTapAction,
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: isActionButtonCircle
                              ? primary
                              : Colors.transparent,
                          child: Icon(actionIcon,
                              size: 30,
                              color: isActionButtonCircle
                                  ? Colors.white
                                  : primary)),
                    ))
              ]
            : null,
        leading: isBack
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(IconUtils.arrowBack))
            : Padding(
                padding: const EdgeInsets.all(5).copyWith(left: 0),
                child: Image.asset(
                  "assets/logos/iqra_logo.png",
                  filterQuality: FilterQuality.high,
                  width: 50,
                  height: 50,
                ),
              ),
        bottom: bottom != null
            ? PreferredSize(
                preferredSize: Size.fromHeight(height), child: bottom!)
            : PreferredSize(
                preferredSize: preferredSize,
                child: Divider(
                  height: 0,
                  color: LightColorTheme.kBorderLightColor,
                )),
        title: title != null
            ? FittedBox(
                child: Text(title!,
                    style: TextStyle(
                        fontSize: 20,
                        color: Styles.fontColor,
                        fontWeight: FontWeight.w600)))
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
