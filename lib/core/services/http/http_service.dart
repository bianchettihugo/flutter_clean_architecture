abstract class HttpErrors {
  static const requestSendTimeout = "request_send_timeout";
  static const requestCancelled = "request_cancelled";
  static const requestConnectTimeout = "request_connect_timeout";
  static const noInternet = "no_internet";
  static const requestReceiveTimeout = "request_receive_timeout";
  static const notFound = "not_found.";
  static const unknownError = "unknown_error";

  static String get error => 'Operation did not complete successfully. '
      'Please, check your internet connection or try again later';
}

enum Method { get, post, put, delete }

Map<Method, String> methods = {
  Method.get: "GET",
  Method.post: "POST",
  Method.put: "PUT",
  Method.delete: "DELETE",
};

abstract class HttpService {
  Future<dynamic> request({
    required Method method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });
}
