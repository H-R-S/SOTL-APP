class AppUrl {
  static var baseUrl = "https://sotl-server.vercel.app/api";

  static var loginEndPoint = "$baseUrl/auth/login";

  static var creatUserEndPoint = "$baseUrl/create";

  static var getUserEndPoint = "$baseUrl/user";

  static var getAllUsersEndPoint = "$baseUrl/user";

  static var updateUserEndPoint = "$baseUrl/update";

  static var getAllCoursesEndPoint = "$baseUrl/course";

  static var initiateObservationEndPoint = "$baseUrl/observation/initiate";

  static var startObservationSchedulingEndPoint =
      "$baseUrl/observation/scheduling";

  static var getAllObservationsEndPoint = "$baseUrl/observation";
}
