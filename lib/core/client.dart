import 'dart:io';
import 'package:dio/dio.dart';
import '../features/auth/data/models/user_model.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: "http://172.20.10.2:8888/api/v1"));
  }

  late final Dio dio;

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 200) {
      return response.data['accessToken'] ??
          (throw Exception("Token topilmadi!"));
    } else {
      throw Exception("Login qilib bo'lmadi!");
    }
  }

  Future<bool> uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap({
      "profilePhoto": await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      )
    });

    var response = await dio.patch(
      '/auth/upload',
      data: formData,
      options: Options(headers: {"Content-Type": "multipart/form-data"}),
    );

    return response.statusCode == 200;
  }

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );

    return response.statusCode == 201;
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');

    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception("Kategoriya ma'lumotlari yuklanmadi!");
    }
  }

  Future<Map<String, dynamic>> fetchRecipe(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');

    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(response.data);
    } else {
      throw Exception("Retsept topilmadi!");
    }
  }

  Future<List<dynamic>> fetchRecipesByCategories(int categoryId) async {
    var response = await dio.get('/recipes/list?category=$categoryId');

    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception(
          "Kategoriya ($categoryId) bo‘yicha retseptlar topilmadi!");
    }
  }
}
