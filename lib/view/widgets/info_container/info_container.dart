import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Function() onTap;

  const InfoContainer(
      {super.key,
      required this.title,
      required this.value,
      required this.onTap,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 18, color: primary);

    return InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 4)),
            ], borderRadius: BorderRadius.circular(10), color: color),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(title,
                        maxLines: 2, overflow: TextOverflow.clip, style: style),
                    Text(value,
                        overflow: TextOverflow.ellipsis,
                        style: style.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold))
                  ])),
              const Icon(Icons.person_outline, size: 30, color: primary)
            ])));
  }
}
