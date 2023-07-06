import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class UserCard extends StatelessWidget {
  final String name, designation, email;
  final Function() onTap;

  const UserCard(
      {required this.onTap,
      required this.name,
      required this.designation,
      required this.email});

  @override
  Widget build(BuildContext context) {
    // const style =
    //     TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold);

    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        // trailing:
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Send Message",
                style: TextStyle(
                    color: Styles.whiteColor,
                    fontSize: 12,
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
        // CircleAvatar(
        //   radius: 40,
        //   backgroundColor: Colors.grey[200],
        //   child: Icon(Icons.person, size: 60, color: primary),
        // ),
        title: Text(name,
            style: TextStyle(
                color: Styles.fontColor,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ),
    );
    // Container(
    //     padding: const EdgeInsets.all(10),
    //     decoration: BoxDecoration(boxShadow: const [
    //       BoxShadow(
    //           color: grey,
    //           spreadRadius: 1,
    //           blurRadius: 5,
    //           offset: Offset(0, 4)),
    //     ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
    //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //       const CircleAvatar(
    //           radius: 40,
    //           backgroundColor: primary,
    //           child: Icon(Icons.person, size: 60, color: Colors.white)),
    //       const SizedBox(height: 10),
    //       Text(name, style: style),
    //       const SizedBox(height: 10),
    //       Text(designation,
    //           style: style.copyWith(
    //               fontSize: 18,
    //               fontWeight: FontWeight.normal,
    //               color: secondary)),
    //       const SizedBox(height: 10),
    //       FittedBox(child: Text(email, style: style))
    //     ]));
  }
}
