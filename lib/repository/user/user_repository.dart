import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/user/user_model.dart';
import '../../resources/url/app_url.dart';

class UserRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<List<UserModel>> getAllUsersApi() async {
    try {
      List<dynamic> response =
          await apiServices.getApiResponse(AppUrl.getAllUsersEndPoint);

      return response = (response).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserApi(int id) async {
    try {
      dynamic response =
          await apiServices.getApiResponse("${AppUrl.getUserEndPoint}/$id");

      return response = UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> createUserApi(dynamic header, data) async {
    try {
      dynamic response = await apiServices.getPostApiResponseWithHeader(
          AppUrl.creatUserEndPoint, header, data);

      return response = UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
