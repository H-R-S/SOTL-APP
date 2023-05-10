abstract class BaseApiServices {

  Future<dynamic> getApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> getPostApiResponseWithHeader(String url, dynamic header, dynamic data);
}