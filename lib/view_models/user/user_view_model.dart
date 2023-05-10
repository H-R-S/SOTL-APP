import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sotl/view/widgets/snack_bar/my_snack_bar.dart';
import '../../models/user/user_model.dart';
import '../../repository/user/user_repository.dart';

class UserViewModel with ChangeNotifier {
  final _userRepo = UserRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> createUser(BuildContext context, UserModel user, String password,
      {String? courseId}) async {
    setLoading(true);
    getUser().then((value) {
      final header = {'Authorization': 'Bearer ${value.token}'};
      print(value.token);
      _userRepo.createUserApi(header, {
        "name": user.name,
        "email": user.email,
        "password": password,
        "role": user.role,
        "campus": user.campus,
        "department": user.department,
        "course": [courseId]
      }).then((value) {
        setLoading(false);
        if (value.token != null && value.token != "") {
          MySnackBar(context, "User Added");
        } else {
          MySnackBar(context, "Something went wrong!.");
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        MySnackBar(context, error.toString());
      });
    });
  }

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('token', user.token.toString());

    notifyListeners();

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final String? token = sp.getString('token');

    return UserModel(token: token);
  }
}
