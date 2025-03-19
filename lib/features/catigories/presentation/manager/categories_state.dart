import '../../data/models/categories_model.dart';
enum CategoriesStates{idle,loading,error}
class CategoriesState {
  CategoriesState( {
    required this.state,
    required this.categories,
    required this.mainCategories,
  });

  final List<CategoriesModel> categories;

 final CategoriesState state;
  final CategoriesModel? mainCategories;

  static var loading;
}
