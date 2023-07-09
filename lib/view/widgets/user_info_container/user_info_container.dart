import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class UserInfoContainer extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String email;
  final String role;

  const UserInfoContainer(
      {super.key, required this.onTap,
      required this.name,
      required this.email,
      required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/profile_img.png'),
          ),
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
      ),
      const SizedBox(height: 10),
      Text(name,
          style: Styles.h2),
      Text(email,
          style: Styles.subHeading),
    ]);
  }
}
