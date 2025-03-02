import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_detail_view.dart';

import '../catigories/data/models/categories_view_model.dart';
import '../catigories/data/repositories/repository.dart';
import '../catigories/presentation/widgets/categoties_view.dart';
import 'client.dart';
import '../features/auth/presentation/pages/complete_your_profile_view.dart';
import '../features/auth/presentation/pages/login_view.dart';
import '../features/auth/presentation/pages/sign_up_view.dart';
import '../features/recipe_detail/data/models/recipe_detail_view_model.dart';
import '../features/recipe_detail/data/repositories/recipe_repository.dart';



GoRouter router = GoRouter(
  initialLocation: '/completeProfile',
  routes: [

    // GoRoute(
    //     path: '/profile',
    //     builder: (context, state) => ProfileView(
    //         viewModel: ProfileViewModel(
    //             repo: ProfileRepository(client: context.read())))),
    GoRoute(path: '/login', builder: (context, state) => LoginView()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpView()),
    GoRoute(
        path: '/completeProfile',
        builder: (context, state) => CompleteYourProfileView()),
    GoRoute(
      path: '/categories/list',
      builder: (context, state) => CategoriesView(
          vm: CategoriesViewModel(
              categoriesRepo: CategoriesRepository(
                client: ApiClient(),
              ))),
    ),
    // GoRoute(
    //   path: '/category-detail',
    //   builder: (context, state) => CategoryDetailView(
    //     vm: CategoryDetailViewModel(
    //       cateRepo: context.read<CategoriesRepository>(),
    //       recipeRepo: context.read<RecipeRepository>(),
    //       selected: state.extra as CategoriesModel,
    //     ),
    //   ),
    // ),
    GoRoute(
      path: '/recipe-detail',
      builder: (context, state) => RecipeDetailView(
        vm: RecipeDetailViewModel(recipeRepo: RecipeRepository(client: context.read()), recipeId: 1),
      ),
    ),
  ],
);
