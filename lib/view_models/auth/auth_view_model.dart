import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    setLoading(true);
    _authRepo.loginApi({"email": email, "password": password}).then((value) {
      if (value.token != null) {
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);

        userPreference.saveUser(UserModel(
            id: value.id,
            email: value.email,
            name: value.name,
            role: value.role,
            token: value.token.toString()));

        debugPrint(value.token);
        MySnackBar(context, "Login successful");

        setLoading(false);

        Navigator.pushReplacementNamed(context, RoutesName.splash);
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }

  Future<bool> logOut() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
