import 'package:flutter/material.dart';

import '../../../resources/constants/style.dart';

// ignore: must_be_immutable
class SettingsContainer extends StatefulWidget {
  final bool isHeader;
  final String? title;
  final IconData icon;
  final Function()? onTap;
  final bool isDrawer;
  final bool isSwitch;
  final Color? iconColor;
  bool isDark;
  bool trailingIcon;

  SettingsContainer(
      {super.key, this.isHeader = false,
      this.title,
      required this.icon,
      this.iconColor,
      this.isDrawer = false,
      this.isSwitch = false,
      this.isDark = false,
      this.onTap,
      this.trailingIcon = true});

  @override
  State<SettingsContainer> createState() => _SettingsContainerState();
}

class _SettingsContainerState extends State<SettingsContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: InkWell(
            onTap: widget.onTap,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SizedBox(
                        width: 25,
                        child: Stack(children: [
                          Center(
                              child: Icon(
                            widget.icon,
                            color: widget.iconColor ?? Styles.fontColor,
                          ))
                        ])),
                    Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          widget.title == null ? "" : widget.title!,
                          style: TextStyle(
                              fontSize: 16, color: Styles.fontColor),
                        ))
                  ]),
                  if (widget.onTap != null)
                    widget.isSwitch
                        ? Switch(value: false, onChanged: (value) {})
                        : widget.trailingIcon != true
                            ? const SizedBox(
                                width: 0.0,
                                height: 0.0,
                              )
                            : Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Styles.fontColor,
                              )
                ])));
  }
}
