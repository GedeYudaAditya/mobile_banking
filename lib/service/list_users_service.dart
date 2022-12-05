import 'dart:math';

import "package:dio/dio.dart";
import 'package:mobile_banking/model/list_users_model.dart';

class ListUsersService {
  Future<List<ListUsersModel>?> getDataUsers() async {
    Dio dio = Dio();
    String url = "https://reqres.in/api/users?page=2";
    final Response response;
    try {
      response = await dio.get(
        url,
      );
      // print(response.data);
      if (response.statusCode == 200) {
        var json = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            return data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
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
      {required String password, required String username}) async {
    Dio dio = Dio();
    String url = "https://reqres.in/api/login";
    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "email": username,
          "password": password
          // "email": "eve.holt@reqres.in",
          // "password": "cityslicka",
          // Login pakai akun ini
        },
      );

      // mengecek apakah berhasil login dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        // Ceritanya data user yang login akan disimpan ke model
        ListUsersModel user = ListUsersModel(
          id: Random().nextInt(100),
          email: username,
          firstName: "Eve",
          lastName: "Holt",
          avatar: "https://reqres.in/img/faces/1-image.jpg",
        );

        // print(user.firstName);
        return user; // kembalikan data user yang sudah di set
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
}
