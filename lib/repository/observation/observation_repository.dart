import 'dart:developer';

import 'package:sotl/models/observation/detail_observation_model.dart';
import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/observation/initiate_observation_model.dart';
import '../../models/observation/observation_model.dart';
import '../../resources/url/app_url.dart';

class ObservationRepository {
  BaseApiServices apiService = NetworkApiService();

  Future<InitiateObservationModel> initiateObservationApi(
      dynamic data, header) async {
    try {
      dynamic response = await apiService.getPostApiResponseWithHeader(
          AppUrl.initiateObservationEndPoint, header, data);

      return response = InitiateObservationModel.fromJson(response);
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

  Future<DetailObservationModel> getObservationByIdApi(int id) async {
    try {
      dynamic response = await apiService
          .getApiResponse("${AppUrl.getAllObservationsEndPoint}/$id");
      log("Reponse: $response");
      return response = DetailObservationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getScheduleObservationApi(dynamic data) async {
    try {
      dynamic response = await apiService.getPostApiResponseWithHeader(
          AppUrl.startObservationSchedulingEndPoint,
          {'Content-Type': 'application/json'},
          data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getSubmitTeachingPlanApi(dynamic data) async {
    try {
      dynamic response = await apiService.getPutApiResponseWithHeader(
          AppUrl.startObservationSchedulingEndPoint,
          {'Content-Type': 'application/json'},
          data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getUpdateTimeSlotApi(dynamic data) async {
    try {
      dynamic response = await apiService.getPutApiResponseWithHeader(
          AppUrl.startObservationSchedulingEndPoint,
          {
            'Content-Type': 'application/json',
          },
          data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
