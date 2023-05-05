import 'package:flutter/foundation.dart';
import '../../data/responses/api_responses.dart';
import '../../models/course/course_model.dart';
import '../../repository/course/course_repository.dart';

class CourseViewModel with ChangeNotifier {
  final _courseRepo = CourseRepository();

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
}
