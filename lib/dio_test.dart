import 'package:dio/dio.dart';
import 'dart:convert';

void main() async {
  Response? response = await getUser();
  print(response.runtimeType);
  print(response?.data);
  //final Map<String, dynamic> userJson = jsonDecode(response?.data);

  response?.data.forEach((key, value) => print("$key : $value"));
}

Future<Response<dynamic>?> getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    // print(response);
    print(response.runtimeType);
    return response;
  } catch (e) {
    print(e);
  }
}

Future<Response<dynamic>?> getUser() async {
  final _baseUrl = 'https://reqres.in/api';
  try {
    var response = await Dio().get(_baseUrl + '/users/10');
    // print(response);
    print(response.runtimeType);
    return response;
  } catch (e) {
    print(e);
  }
}
