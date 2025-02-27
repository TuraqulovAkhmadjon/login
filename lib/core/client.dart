import 'dart:io';

import 'package:dio/dio.dart';

import '../features/auth/data/models/user_model.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: "http://192.168.9.204:8888/api/v1"));
  }

  late final Dio dio;

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Login qilib bo'lmadi!");
    }
  }

  Future<bool> uploadProfilePhoto(File file) async {
    FormData fromData = FormData.fromMap(
      {
        "profilePhoto": await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last)
      },
    );

    var response = await dio.patch('/auth/upload',
        data: fromData,
        options: Options(headers: {"Content-Type": "multipart/from-data"}));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> signUp(UserModel model) async {
    print("nimadir00");
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("Failed to load my profile data");
    }
  }
  Future<dynamic>fetchRecipe(recipeId)async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode ==200) {
      dynamic data =response.data;
      return data;
      
    } else{
      throw Exception("ma'lumot yuq");
    }

   
  }
}
