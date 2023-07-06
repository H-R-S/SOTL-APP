import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/snack_bar/my_snack_bar.dart';
import '../../models/user/user_model.dart';
import '../../routes/routes_name.dart';
import '../../view_models/user/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (value.token == "null" || value.token == "" || value.token == null) {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        debugPrint("Token: ${value.token}");
        debugPrint("Role: ${value.role}");

        if (value.role == "Admin" ||
            value.role == "Campus_Director" ||
            value.role == "Head_of_Department") {
          Navigator.pushReplacementNamed(context, RoutesName.admin);
        }
        if (value.role == "Faculty" || value.role == "Observer") {
          Navigator.pushReplacementNamed(context, RoutesName.faculty);
        } else {
          MySnackBar(context, "No role found!");
          Navigator.pushReplacementNamed(context, RoutesName.login);
        }
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}
