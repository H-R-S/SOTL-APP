import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/user/user_model.dart';
import '../../resources/url/app_url.dart';

class AuthRespository {
  BaseApiServices apiServices = NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      print(response);
      return response = UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
