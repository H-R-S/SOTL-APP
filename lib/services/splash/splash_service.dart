import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user/user_model.dart';
import '../../routes/routes_name.dart';
import '../../view_models/user/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    final user = Provider.of<UserViewModel>(context, listen: false);

    getUserData().then((value) {
      if (value.token == "null" || value.token == "") {

        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        if (kDebugMode) {
          print("token: ${value.token}");
        }
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
