import 'package:flutter/cupertino.dart';

import '../repositories/repository.dart';
import 'categories_model.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required CategoriesRepository categoriesRepo})
      : _categoriesRepo = categoriesRepo {
    load();
  }

  final CategoriesRepository _categoriesRepo;

  List<CategoriesModel> categories = [];

  CategoriesModel? mainCategories;

  Future<void> load() async {
    var all = await _categoriesRepo.fetchCatigories();
    mainCategories = all.where((data) => data.main).firstOrNull;
    categories = all.where((data) => data.id != mainCategories?.id).toList();
    notifyListeners();
  }
}
