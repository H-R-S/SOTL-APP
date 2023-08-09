abstract class BaseApiServices {

  Future<dynamic> getApiResponse(String url);

  Future<dynamic> getPutApiResponse(String url, dynamic data);

  Future<dynamic> getPutApiResponseWithHeader(String url, dynamic header, dynamic data);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> getPostApiResponseWithHeader(String url, dynamic header, dynamic data);
}