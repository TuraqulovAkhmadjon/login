import 'package:flutter/cupertino.dart';
import '../../data/models/recipe_community_model.dart';
import '../../data/repositories/recipe_community_repository.dart';

class RecipeCommunityViewModel extends ChangeNotifier {
  RecipeCommunityViewModel({
    required this.limit,
    required this.order,
    required this.descending,
    required RecipeCommunityRepository communityRepo,
  })  : _communityRepo = communityRepo {
    load();
  }

  final RecipeCommunityRepository _communityRepo;

  bool isLoading = true;
  final int limit;
  final String order;
  bool descending;

  List<RecipeCommunityModel> community = [];
  List<String> titles = ["Top Recipes", "Newest", "Oldest"];
  int selectedTabIndex = 0;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    community = await _communityRepo.fetchCommunityRecipes(limit, order, descending);

    isLoading = false;
    notifyListeners();
  }

  void updateTabIndex(int index) {
    if (selectedTabIndex != index) {
      selectedTabIndex = index;
      notifyListeners();
    }
  }

}
