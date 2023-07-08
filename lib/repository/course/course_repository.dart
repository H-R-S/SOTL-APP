import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/course/course_model.dart';
import '../../resources/url/app_url.dart';

class CourseRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<List<CourseModel>> fetchAllCourses() async {
    try {
      List<dynamic> response =
          await apiServices.getApiResponse(AppUrl.getAllCoursesEndPoint);

      return response = (response).map((e) => CourseModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> assignedCourseApi(int userId, dynamic data) async {
    try {
      dynamic response = await apiServices.getPutApiResponse(
          "${AppUrl.getAllCoursesEndPoint}/user/$userId", data);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
