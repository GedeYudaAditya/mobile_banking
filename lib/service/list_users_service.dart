import 'dart:math';

import "package:dio/dio.dart";
import 'package:mobile_banking/model/list_users_model.dart';

import '../model/list_users_model.dart';

class ListUsersService {
  Future<List<ListUsersModel>?> getDataUsers() async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com/users";
    final Response response;
    try {
      response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var json = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            dynamic send = data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
            print(send);
            return send;
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  // Reqres Login Services (Buat login nya)
  Future<ListUsersModel?> loginUsers(
      {required String password, required String email}) async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com";
    final Response response;

    try {
      response = await dio.post(
        url,
        data: {"username": email, "password": password},
      );

      // mengecek apakah berhasil login dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;

        if (!json.keys.contains('data')) {
          return null;
        } else {
          // convert data json ke bentuk map
          if (json['data'] is List) {
            var data = json['data'];

            List<dynamic> dataList = (data as List).cast<dynamic>();

            print(dataList);

            double? balence = double.parse(dataList[0]['saldo']);
            int? id = int.parse(dataList[0]['user_id']);

            ListUsersModel user = ListUsersModel(
              user_id: id,
              username: dataList[0]['username'],
              nama: dataList[0]['nama'],
              // avatar: "https://reqres.in/img/faces/1-image.jpg",
              saldo: balence,
            );
            // print(user.firstName);
            return user; // kembalikan data user yang sudah di set
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  // Reqres Register Services (Buat register nya)
  Future<ListUsersModel?> registerUsers(
      {required String password,
      required String name,
      required String email}) async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com/register";
    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "username": email,
          "password": password,
          "nama": name,
        },
      );

      // mengecek apakah berhasil login dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        print(data['status']);
        if (data['status'] != 'error') {
          return null;
        } else {
          Future<ListUsersModel?> result =
              loginUsers(password: password, email: email);
          print(result);
          return result;
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
}
