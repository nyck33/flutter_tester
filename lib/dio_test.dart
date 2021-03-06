import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _baseUrl = 'https://coupon-fastapi.herokuapp.com';

final dio = Dio();

///to get this Json, dummyUser.toJson() which is a Map<String, dynamic> with the
///Coupon(couponId)...type printout but need to jsonEncode to get string keys
final dummyJson = {
  "userId": 0,
  "name": "dummyuser",
  "email": "nobu.kim66@gmail.com",
  "loginStatus": "loggedIn",
  "currentScreen": "homeScreen",
  "hotelName": "HiltonAmsterdam",
  "roomNumber": "33",
  "checkInDate": "1976-05-31T00:00:00.000Z",
  "checkOutDate": "2100-05-31T00:00:00.000Z",
  "avatarExists": false,
  "avatarUrl": "",
  "coupons": [
    {
      "couponId": 0,
      "couponType": "breakfast",
      "hotelName": "Hilton Amsterdam",
      "expiryDate": "2100-01-01",
      "couponAmount": "yen500",
      "usedOn": null,
      "isUsed": false,
      "imageExists": true,
      "details": "This coupon can beused at the continental breakfast buffet",
      "imageUrl": "assets/images/coupons/500yenOff.png",
      "couponName": "朝食割引クーポン"
    },
    {
      "couponId": 1,
      "couponType": "dinner",
      "hotelName": "Hilton Amsterdam",
      "expiryDate": "2100-01-01",
      "couponAmount": "yen1000",
      "usedOn": null,
      "isUsed": false,
      "imageExists": true,
      "details": "This coupon can be used at the buffet dinner with live music",
      "imageUrl": "assets/images/coupons/1000yenOff.png",
      "couponName": "夕食割引クーポン"
    },
    {
      "couponId": 2,
      "couponType": "stay",
      "hotelName": "Hilton Amsterdam",
      "expiryDate": "2100-01-01T00:00:00.000Z",
      "couponAmount": "special",
      "usedOn": null,
      "isUsed": false,
      "imageExists": true,
      "details":
          "This coupon can be used at the nightly Wine and Cheese with host Oprah Winfrey",
      "imageUrl": "assets/images/coupons/apaSpecial.png",
      "couponName": "宿泊割引クーポン"
    }
  ]
};

/*
void main() async {
  DioTester dioTester = DioTester();
  //Response? response = await postUser(); //await getUser();
  Response? response = await dioTester.getAllCoupons(); //await getUser();

  //AsyncValue<Response> response = watch(DioTester().couponsProvider);

  print(response.runtimeType);
  print(response?.data);
  //jsonDecode returned a string for Dio
  //final Map<String, dynamic> userJson = jsonDecode(response?.data);

  response?.data.forEach((key, value) => print("$key : $value"));
}
*/

class DioTester {
  /*
  final couponsProvider = FutureProvider<Response<dynamic>?>((ref) async {
    //final Response? response;
    const String path = '/get-all-coupons';

    try {
      //response = await dio.get(_baseUrl + path);
      final Map<String, dynamic>? response =
          await dio.get(_baseUrl + path) as Map<String, dynamic>;

      //print('repo response.data: ${response.data}');
      //return response.data;
      return response?['coupons'];
    } catch (e) {
      print('getAllCoupons error: $e');
    }
  });
  */
  final cProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
    const String path = '/get-all-coupons';
    final Response? response;
    final Map<String, dynamic>? couponsJson;
    try {
      response = await dio.get(_baseUrl + path);
      couponsJson = response.data;
      return couponsJson;
    } catch (e) {
      print('error cProvider $e');
      //return null;
    }
  });

  Future<Response<dynamic>?> getAllCoupons() async {
    final String path = '/get-all-coupons';
    final Response? response;

    try {
      response = await dio.get(_baseUrl + path);
      print('repo response.data: ${response.data}');
      return response.data;
    } catch (e) {
      print('getAllCoupons error: $e');
    }
  }

  Future<Response<dynamic>?> postUser() async {
    final Response? response;
    //final path = '/get-all-coupons/';
    final path = '/user-update-coupons/';
    try {
      response = await dio.post(_baseUrl + path, data: dummyJson);
      print(response.data);
    } catch (e) {
      print('post error: $e');
    } finally {
      print('done');
    }
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
}
