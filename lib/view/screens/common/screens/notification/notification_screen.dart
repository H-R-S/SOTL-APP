import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        isBack: true,
        title: "Notifications",
      ),
    );
  }
}
