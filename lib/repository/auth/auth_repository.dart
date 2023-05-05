import 'package:sotl/data/network/base_api_service.dart';
import 'package:sotl/data/network/network_api_service.dart';
import 'package:sotl/models/user/user_model.dart';
import 'package:sotl/resources/url/app_url.dart';

class AuthRespository {
  BaseApiServices apiServices = NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);

      return response = UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
