import 'dart:io';
import 'package:dio/dio.dart';
import '../features/auth/data/models/user_model.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: "http://10.10.0.173:8888/api/v1"));
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

  Future<List<dynamic>> fetchTopChefsForHome({int? limit}) async {
    final response = await dio.get('/auth/top-chefs?Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/auth/top-chefs?Limit=${limit ?? ''} so'rovimiz xato ketti");
    }
  }

  Future<List<dynamic>> fetchTrendingRecipe() async {
    var response = await dio.get('/recipes/trending-recipe');
    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception("Ma'lumot kelmayapti");
    }
  }

  Future<List<dynamic>> fetchYourRecipes() async {
    var response = await dio.get('/recipes/list?Limit=2');
    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception("Ma'lumot topilmadi");
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
  Future<Map<String,dynamic>>fetchTrendingRecipes()async{
    var response=await dio.get('/recipes/trending-recipe');
    if (response.statusCode==200) {
      return Map<String,dynamic>.from(response.data);

    }  else{
      throw Exception('Malumot yuq');
    }
  }

  Future<Map<String, dynamic>> fetchReview(int recipeId) async {
    var response = await dio.get('/recipes/reviews/detail/$recipeId');
print("malumot ${response.data}");
    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(response.data);
    } else {
      throw Exception("Sharhlarni yuklab bo‘lmadi!");
    }
  }

  Future<List<dynamic>> fetchReviewComment(int recipeId) async {
    var response = await dio.get('/reviews/list?recipeId=$recipeId');
    print("malumot ${response.data}");

    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception("Sharhlarni yuklab bo‘lmadi!");
    }
  }

  Future<bool> postReviewComment(
        int recipeId, String comment, int rating, File file) async {
    FormData formData = FormData.fromMap({
      "recipeId":recipeId,
      "comment":comment,
      "rating":rating,
      "image": await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
    });

    final response = await dio.post(
        "/reviews/create",
        options: Options(headers: {"Content-Type": "multipart/form-data"}),
        data: formData);
    if (response.statusCode == 200) {
      return true;
    } else {
      print("nimadir");
      return false;
    }
  }



  Future<List<dynamic>> fetchCommunity(
      int? limit, String order, bool descending) async {
    var response = await dio.get(
        '/recipes/community/list?Limit=$limit&Order=$order&Descending=$descending');
    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception("Ma'lumot kelmadi communitydan");
    }
  }

  Future<List<dynamic>> fetchRecipesByCategories(int categoryId) async {
    var response = await dio.get('/recipes/list?categoryId=$categoryId');

    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception(
          "Kategoriya ($categoryId) bo‘yicha retseptlar topilmadi!");
    }
  }
}
