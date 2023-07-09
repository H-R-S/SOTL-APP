import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../resources/constants/style.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final int value;
  final Color backgroundColor;
  final Function() onTap;

  const InfoContainer(
      {super.key,
      required this.title,
      required this.value,
      required this.onTap,
      this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 14, color: primary);

    return InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 10, 20),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 4)),
            ], borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset("assets/images/icons/person.svg",
                    color: primary),
                const SizedBox(height: 10),
                FittedBox(
                  child: Text("$value\n\n",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: style.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 20)),
                ),
                FittedBox(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: style.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )));
  }
}
