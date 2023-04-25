import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';

class FacultyHomeScreen extends StatelessWidget {
  FacultyHomeScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(scaffoldKey, context, title: "Dashboard"),
    );
  }
}