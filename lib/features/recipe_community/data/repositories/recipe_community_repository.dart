import '../../../../core/client.dart';
import '../models/recipe_community_model.dart';

class RecipeCommunityRepository {
  final ApiClient client;
  List<RecipeCommunityModel>? community = [];

  RecipeCommunityRepository({required this.client});

  Future<List<RecipeCommunityModel>> fetchCommunityRecipes(int limit, String order, bool descending) async {
    if (community!.isNotEmpty){
      return community!;
    }else{
      var rawCommunity = await client.fetchCommunity(limit, order, descending);
      community = rawCommunity.map((json) => RecipeCommunityModel.fromJson(json)).toList();
      return community!;
    }
  }
}
