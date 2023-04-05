import 'package:flutter/material.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class UsersScreen extends StatelessWidget {
  
  UsersScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: MyAppBar(scaffoldKey, context, title: "Users")));
  }
}
