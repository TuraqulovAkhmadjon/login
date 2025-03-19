import 'package:flutter/cupertino.dart';
import '../../data/models/recipe_community_model.dart';
import '../../data/repositories/recipe_community_repository.dart';

class RecipeCommunityViewModel extends ChangeNotifier {
  RecipeCommunityViewModel({required RecipeCommunityRepository communityRepo})
      : _communityRepo = communityRepo {
    load();
  }

  final RecipeCommunityRepository _communityRepo;

  bool isLoading = true;
  int selectedTabIndex = 0;

  List<RecipeCommunityModel> allRecipes = [];
  List<RecipeCommunityModel> filteredRecipes = [];

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    allRecipes.clear();

    try {
      if (selectedTabIndex == 0) {
        // Top Rated
        allRecipes = await _communityRepo.fetchCommunityRecipes(85, "rating", true);
      } else if (selectedTabIndex == 1) {
        // Newest
        allRecipes = await _communityRepo.fetchCommunityRecipes(85, "data", true);
      } else if (selectedTabIndex == 2) {
        // Oldest
        allRecipes = await _communityRepo.fetchCommunityRecipes(85, "date", false);
      }

      filteredRecipes = List.from(allRecipes);

    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  void updateTabIndex(int index) {
    if (selectedTabIndex != index) {
      selectedTabIndex = index;
      load();
    }
  }
}