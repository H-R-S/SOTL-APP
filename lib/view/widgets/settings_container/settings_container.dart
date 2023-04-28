import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final bool isHeader;
  final String? title;
  final IconData icon;
  final Function()? onTap;
  final bool isDrawer;
  final bool isSwitch;
  final Color? iconColor;
  bool isDark;

  SettingsContainer(
      {super.key,
      this.isHeader = false,
      this.title,
      required this.icon,
      this.iconColor,
      this.isDrawer = false,
      this.isSwitch = false,
      this.isDark = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      SizedBox(
                          width: 25,
                          child: Stack(children: [
                            Center(
                                child: Icon(
                              icon,
                              color: iconColor ?? Colors.grey,
                            ))
                          ])),
                      Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            title == null ? "" : title!,
                            style: const TextStyle(fontSize: 18),
                          ))
                    ]),
                    if (onTap != null)
                      isSwitch
                          ? Switch(value: false, onChanged: (value) {})
                          : const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.grey,
                            )
                  ]),
            )));
  }
}
