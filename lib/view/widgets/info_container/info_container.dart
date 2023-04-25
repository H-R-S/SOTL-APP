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
      this.color = primary});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20, color: Colors.white);

    return InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: color),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.supervisor_account_sharp, color: primary)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: style),
                      Text(value, overflow: TextOverflow.ellipsis, style: style)
                    ]),
              )
            ])));
  }
}
