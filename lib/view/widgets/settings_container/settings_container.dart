import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sotl/resources/constants/icons.dart';
import '../../../resources/constants/style.dart';

class SettingsContainer extends StatelessWidget {
  final bool isHeader;
  final String? title;
  final String icon;
  final Function()? onTap;
  final bool isDrawer;
  final bool isSwitch;
  final Color? iconColor;
  final bool isDark;
  final bool trailingIcon;

  const SettingsContainer(
      {super.key,
      this.isHeader = false,
      this.title,
      required this.icon,
      this.iconColor,
      this.isDrawer = false,
      this.isSwitch = false,
      this.isDark = false,
      this.onTap,
      this.trailingIcon = true});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);

    // bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Center(
                  child: SvgPicture.asset(
                icon,
                height: 20,
                width: 20,
                color: iconColor ?? Colors.black,
              )),
              Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    title == null ? "" : title!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Styles.fontColor),
                  ))
            ]),
            if (onTap != null)
              // widget.isSwitch
              //     ? Switch(
              //         inactiveTrackColor: Colors.grey,
              //         activeTrackColor: primary,
              //         value: isDark,
              //         onChanged: (value) {
              //           setState(() {
              //             isDark = value;
              //           });
              //         })
              //     :
              trailingIcon != true
                  ? const SizedBox(
                      width: 0.0,
                      height: 0.0,
                    )
                  : SvgPicture.asset(
                      IconUtils.arrowForward,
                      height: 20,
                      width: 20,
                    )
          ]),
        ));
  }
}
