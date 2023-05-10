import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user/user_model.dart';
import '../../repository/auth/auth_repository.dart';
import '../../routes/routes_name.dart';
import '../../view/widgets/snack_bar/my_snack_bar.dart';
import '../user/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRespository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    _authRepo.loginApi({"email": email, "password": password}).then((value) {
      if (value.token != null) {
        print(value);

        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);

        userPreference.saveUser(UserModel(token: value.token.toString()));

        if (kDebugMode) {
          print(value.token);
        }
        MySnackBar(context, "Login successful");

        setLoading(false);

        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }
}