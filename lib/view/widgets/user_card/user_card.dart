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
    const style =
        TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold);

    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: grey,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4)),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
              radius: 40,
              backgroundColor: primary,
              child: Icon(Icons.person, size: 60, color: Colors.white)),
          const SizedBox(height: 10),
          Text(name, style: style),
          const SizedBox(height: 10),
          Text(designation,
              style: style.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: secondary)),
          const SizedBox(height: 10),
          FittedBox(child: Text(email, style: style))
        ]));
  }
}
