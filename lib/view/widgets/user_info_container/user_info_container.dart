import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class UserInfoContainer extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String email;
  final String role;

  const UserInfoContainer(
      {super.key,
      required this.onTap,
      required this.name,
      required this.email,
      required this.role});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal);

    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: primary),
          child: Row(children: [
            const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: primary, size: 30)),
            const SizedBox(width: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: style.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(email, style: style.copyWith(color: Colors.white54)),
              const SizedBox(height: 5),
              Text(role, style: style)
            ])
          ])),
    );
  }
}
