import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/widgets/routes.dart';
import 'package:recipe_app/features/category_detail/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:recipe_app/features/recipe_community/presentation/manager/recipe_community_view_model.dart';
import 'package:recipe_app/features/recipe_community/presentation/pages/recipe_community_view.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_view.dart';
import 'package:recipe_app/features/recipe_home/presentation/manager/recipe_home_view_model.dart';
import 'package:recipe_app/features/recipe_home/presentation/pages/recipe_home_view.dart';
import 'package:recipe_app/features/review/presentation/manager/created_review/create_review_bloc.dart';
import 'package:recipe_app/features/review/presentation/manager/reviews/review_bloc.dart';
import 'package:recipe_app/features/review/presentation/pages/create_review_view.dart';
import 'package:recipe_app/features/top_chef/presentation/pages/top_chef_profile.dart';
import '../features/auth/presentation/pages/complete_your_profile_view.dart';
import '../features/auth/presentation/pages/login_view.dart';
import '../features/auth/presentation/pages/sign_up_view.dart';
import '../features/category_detail/presentation/pages/category_detail_view.dart';
import '../features/catigories/presentation/manager/categories_view_model.dart';
import '../features/catigories/data/repositories/repository.dart';
import '../features/catigories/presentation/widgets/categoties_view.dart';
import '../features/recipe_detail/data/models/recipe_detail_view_model.dart';
import '../features/recipe_detail/data/repositories/recipe_repository.dart';
import '../features/review/presentation/widgets/review_view.dart';
import '../features/trending_recipes/pages/trending_recipes_view.dart';
import 'client.dart';

final apiClient = ApiClient();

GoRouter router = GoRouter(
  initialLocation: '/top_chefs',
  // Routes.getReview(2),
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginView()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpView()),
    GoRoute(
      path: '/completeProfile',
      builder: (context, state) => CompleteYourProfileView(),
    ),
    GoRoute(
      path: '/category-detail',
      builder: (context, state) => CategoryDetailView(
        vm: CategoryDetailViewModel(
          catRepo: context.read(),
          recipeRepo: RecipeRepository(client: ApiClient()),
        )..load(),
      ),
    ),
    GoRoute(path: Routes.review,
      builder: (context, state) => BlocProvider(
        create: (context) => ReviewsBloc(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: ReviewView(),
      ),
    ),
    // GoRoute(
    //     path: Routes.createReview,
    //     builder: (context, state) => BlocProvider(
    //         create: (context) => CreateReviewBloc(recipeRepo: context.read()),
    //         child: CreateReviewView())),

    GoRoute(
      path: '/home',
      builder: (context, state) => RecipeHomeView(
        vm: RecipeHomeViewModel(
          catRepo: CategoriesRepository(client: ApiClient()),
          recipeRepo: RecipeRepository(client: ApiClient()),
        ),
      ),
    ),
// GoRoute(
//   path: '/categories',
//   builder: (context, state) => BlocProvider(
//       create: (context) => CategoriesCubit(
//             categoriesRepo: context.read<CategoriesRepository>(),
//           ),
//           child: CategoriesView()),
// ),
    GoRoute(
      path: '/recipes_community',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) =>
            RecipeCommunityViewModel(communityRepo: context.read()),
        child: RecipeCommunityView(),
      ),
    ),
    GoRoute(path: '/trending_recipes',builder: (context,state)=> TrendingRecipesView()),

    GoRoute(path: '/top_chefs',builder: (context,state)=>TopChefProfileView()),

    GoRoute(
      path: '/recipe-detail/:recipeId',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RecipeDetailViewModel(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: RecipeDetailView(),
      ),
    ),
  ],
);
