import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        debugPrint("Name: ${value.name}");

        final userViewModel =
            Provider.of<UserViewModel>(context, listen: false);

        userViewModel.setUserId(value.id!);
        userViewModel.setUserRole(value.role!);
        debugPrint("uid: ${value.id.toString()}");

        if (value.role == "Admin" ||
            value.role == "Dean" ||
            value.role == "Campus_Director" ||
            value.role == "Head_of_Department") {
          Navigator.pushReplacementNamed(context, RoutesName.admin);
        }
        if (value.role == "Faculty" ) {
          Navigator.pushReplacementNamed(context, RoutesName.faculty);
        }
        if (value.role == "Observer") {
          Navigator.pushReplacementNamed(context, RoutesName.observer);
        }
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}
