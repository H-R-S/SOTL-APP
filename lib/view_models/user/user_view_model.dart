import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/responses/api_responses.dart';
import '../../models/user/user_model.dart';
import '../../repository/user/user_repository.dart';
import '../../view/widgets/snack_bar/my_snack_bar.dart';

class UserViewModel with ChangeNotifier {
  final _userRepo = UserRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String _userRole = "";

  String get userRole => _userRole;

  setUserRole(String value) {
    _userRole = value;
    notifyListeners();
  }

  int _userId = 0;

  int get userId => _userId;

  setUserId(int value) {
    _userId = value;
    notifyListeners();
  }

  ApiResponse<List<UserModel>> usersList = ApiResponse.loading();

  setUsersList(ApiResponse<List<UserModel>> response) {
    usersList = response;
    notifyListeners();
  }

  Future<void> getAllUsers() async {
    setUsersList(ApiResponse.loading());

    _userRepo.getAllUsersApi().then((value) {
      setUsersList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUsersList(ApiResponse.error(error.toString()));
    });
  }

  // Future<void> getUserById({required int userId}) async{
  //   setUsersList(ApiResponse.loading());

  //   _userRepo.getUserApi(userId).then((value) {
  //     setUsersList(ApiResponse.completed(value));
  //   }).onError((error, stackTrace) {
  //     setUsersList(ApiResponse.error(error.toString()));
  //   });
  // }

  Future<void> createUser(BuildContext context, UserModel user,
      {required String password, required List<int> courseId}) async {
    setLoading(true);
    getUser().then((value) {
      final header = {'Authorization': 'Bearer ${value.token}'};
      _userRepo
          .createUserApi(
              header,
              jsonEncode({
                "name": user.name,
                "email": user.email,
                "password": password,
                "role": user.role,
                "campus": user.campus,
                "department": user.department,
                if (user.role == "Faculty") "courses": courseId
              }))
          .then((value) {
        setLoading(false);
        if (value.token != null && value.token != "") {
          MySnackBar(context, "User Added");
          debugPrint(value.toString());
        } else {
          MySnackBar(context, "Something went wrong!.");
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        debugPrint("err: $error");
        MySnackBar(context, error.toString());
      });
    });
  }

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('token', user.token.toString());
    sp.setInt('id', user.id!);
    sp.setString('email', user.email.toString());
    sp.setString('name', user.name.toString());
    sp.setString('role', user.role.toString());
    setUserRole(user.role.toString());
    notifyListeners();

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final String? token = sp.getString('token');
    final int? id = sp.getInt('id');
    final String? email = sp.getString('email');
    final String? name = sp.getString('name');
    final String? role = sp.getString('role');

    return UserModel(
        token: token, id: id, email: email, name: name, role: role);
  }
}
