// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipe_app/features/catigories/presentation/manager/categories_state.dart';
//
// import '../../data/repositories/repository.dart';
// import '../../data/models/categories_model.dart';
//
// class CategoriesCubit extends Cubit<CategoriesState> {
//   CategoriesCubit({
//     required CategoriesRepository categoriesRepo,
//   })  : _categoriesRepo = categoriesRepo,
//         super(CategoriesState(categories: [], mainCategories: null,state: CategoriesState.loading)) {
//     load();
//   }
//
//   final CategoriesRepository _categoriesRepo;
//
//   Future<void> load() async {
//     final allCategories = await _categoriesRepo.fetchCatigories();
//     emit(
//       CategoriesState(
//           categories: allCategories.where((category) => !category.main).toList(),
//           mainCategories: allCategories.firstWhere((category) => category.main)),
//       status:CategoriesState(state: state, categories: categories, mainCategories: mainCategories)
//     );
//   }
// }
