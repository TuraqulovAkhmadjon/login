// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipe_app/core/utils/sizes.dart';
// import 'package:recipe_app/features/catigories/presentation/manager/categories_state.dart';
// import '../manager/categories_view_model.dart';
// import 'categories_app_bar.dart';
// import 'categories_bottom_nav_bar.dart';
// import 'category_item.dart';
// import 'main_categories_item.dart';
//
// class CategoriesView extends StatelessWidget {
//   const CategoriesView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoriesCubit,CategoriesState>(
//       builder:(context, state)=> Scaffold(
//         bottomNavigationBar:  CategoriesBottomNavBar(),
//         appBar:  RecipeAppBar(title: "Categories"),
//         extendBody: true,
//         body: ListView(
//           padding:EdgeInsets.only(left:36,right: 36),
//           children: [
//             if (state.mainCategories != null)
//               MainCategoriesItem(
//                 title: state.mainCategories?.title ?? '',
//                 image: state.mainCategories?.image ?? '',
//               ),
//             SizedBox(height: 20),
//             GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               padding: EdgeInsets.only(bottom: 120),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisExtent: 176,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 39,
//                   childAspectRatio: 178/60
//               ),
//               itemCount: state.categories.length,
//               itemBuilder: (context, index) {
//                 return CategoryItem(
//                   image: state.categories[index].image,
//                   title: state.categories[index].title,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
