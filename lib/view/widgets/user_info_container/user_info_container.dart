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
    const style =
        TextStyle(fontSize: 20, color: primary, fontWeight: FontWeight.normal);

    return InkWell(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.all(20).copyWith(top: 0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3))
            ], borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Row(children: [
              const CircleAvatar(
                  radius: 30,
                  backgroundColor: primary,
                  child: Icon(Icons.person, color: Colors.white, size: 30)),
              const SizedBox(width: 20),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: style.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(email,
                        style: style.copyWith(
                            color: primary.withOpacity(0.6))),
                    const SizedBox(height: 5),
                    Text(role, style: style)
                  ])
            ])));
  }
}
