import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/responses/api_responses.dart';
import '../../models/course/course_model.dart';
import '../../repository/course/course_repository.dart';
import '../../view/widgets/snack_bar/my_snack_bar.dart';

class CourseViewModel with ChangeNotifier {
  final _courseRepo = CourseRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _faculty = false;

  bool get faculty => _faculty;

  setFaculty(bool value) {
    _faculty = value;
    notifyListeners();
  }

  ApiResponse<List<CourseModel>> courseList = ApiResponse.loading();

  setCourseList(ApiResponse<List<CourseModel>> response) {
    courseList = response;
    notifyListeners();
  }

  Future<void> getAllCourses() async {
    setCourseList(ApiResponse.loading());

    _courseRepo.fetchAllCourses().then((value) {
      setCourseList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setCourseList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> assignedCourse(
      BuildContext context, int facultyId, List<int> slotId) async {
    setLoading(true);

    final body = {"slots": slotId};

    _courseRepo.assignedCourseApi(facultyId, jsonEncode(body)).then((value) {
      setLoading(false);
      MySnackBar(context, "Course Assigned");
    }).onError((error, stackTrace) {
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }
}
