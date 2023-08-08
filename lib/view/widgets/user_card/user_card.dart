import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class UserCard extends StatelessWidget {
  final String name, designation, email;
  final Function() onTap;

  const UserCard(
      {super.key,
      required this.onTap,
      required this.name,
      required this.designation,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        isThreeLine: true,
        trailing: const Icon(Icons.more_vert),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text(
                email,
                style: TextStyle(
                    color: Styles.fontLightColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        horizontalTitleGap: 2.0,
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
        leading: Container(
          height: 70,
          decoration: BoxDecoration(
            color: primary.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: const Icon(Icons.person_outline, size: 30, color: primary),
        ),
        title: Text(name,
            style: TextStyle(
                color: Styles.fontColor,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
