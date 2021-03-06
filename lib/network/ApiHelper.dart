import 'package:dio/dio.dart';
import '../constan.dart';

Future registerUser(String firstName, String lastName, String email,
    String password, String confPassword, String gender, String pNo) async {
  /* String url = "http://staging.php-dev.in:8844/trainingapp/api/users/register";
  final response = await http.post(url,
  headers: {"Accept" : "Application/Json"},
  body: {'first_name' : firstName, 'last_name' : lastName, 'email' : email, 'password': password, 'confirm_password': confPassword, 'gender': gender, 'phone_no' : pNo});

  print(response.body);
  var convertedData = jsonDecode(response.body);
  return convertedData;*/
}

Future<Response> getPostResponse(FormData fromData) async {
  var dio = Dio();
  try {
    var response = await dio.post(baseUrl,
        data: fromData, options: Options(headers: headers()));

    return response;
  } on DioError catch (error) {
    return error.response;
  }
}

Future<Response> getResponse(Map data) async {
  var dio = Dio();
  try {
    var response = await dio.get(baseUrl,
        queryParameters: {
          "product_category_id": "1",
          "limit": "10",
          "page": "1",
        }, options: Options(headers: headers()));

    print(response);
    return response;
  } on DioError catch (error) {
    return error.response;
  }
}

headers() {
  return {
    "Accept": "Application/Json",
    "Content-Type": "application/x-www-fo rm-urlencoded"
  };
}
