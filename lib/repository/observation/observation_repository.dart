import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/observation/observation_model.dart';
import '../../resources/url/app_url.dart';

class ObservationRepository {
  BaseApiServices apiService = NetworkApiService();

  Future<void> initiateObservationApi(dynamic data, header) async {
    try {
      dynamic response = await apiService.getPostApiResponseWithHeader(
          AppUrl.initiateObservationEndPoint, header, data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ObservationModel>> getAllObservationsApi() async {
    try {
      List<dynamic> response =
          await apiService.getApiResponse(AppUrl.getAllObservationsEndPoint);

      return response =
          (response).map((e) => ObservationModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
