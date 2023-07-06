import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../resources/constants/style.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final Function() onTap;

  const InfoContainer(
      {super.key, required this.title,
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
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 4)),
                ],
                borderRadius: BorderRadius.circular(10),
                color: value == '45' ? primary : Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(
                  "assets/images/icons/person.svg",
                  color: value != '45' ? primary : Colors.white,
                ),
                const SizedBox(height: 10),
                FittedBox(
                  child: Text("$value\n\n",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: style.copyWith(
                          color: value != '45' ? primary : Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                ),
                FittedBox(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: style.copyWith(
                        color: value != '45' ? primary : Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )

            //  Row(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           color: backgroundColor.withOpacity(0.2),
            //           borderRadius: BorderRadius.circular(5),
            //         ),
            //         margin: const EdgeInsets.only(right: 5),
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 10.0, vertical: 10.0),
            //         child: Icon(Icons.person_outline, size: 30, color: backgroundColor),
            //       ),
            //       Expanded(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(title,
            //                 maxLines: 2,
            //                 textAlign: TextAlign.center,
            //                 overflow: TextOverflow.clip,
            //                 style: style.copyWith(
            //                   color: GlobalVariable.fontColor,
            //                   fontSize: 14,
            //                 )),
            //             Text(value,
            //                 overflow: TextOverflow.ellipsis,
            //                 style: style.copyWith(
            //                     color: GlobalVariable.fontColor,
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold)),
            //           ],
            //         ),
            //       )
            //     ])
            ));
  }
}
