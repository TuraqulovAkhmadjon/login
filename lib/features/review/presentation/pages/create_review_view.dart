import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/categories_bottom_nav_bar.dart';

import '../../../../core/utils/colors.dart';
import '../../../catigories/presentation/widgets/categories_app_bar.dart';
import '../manager/created_review/create_review_bloc.dart';
import '../manager/created_review/create_review_state.dart';

class CreateReviewView extends StatefulWidget {
  const CreateReviewView({super.key});

  @override
  State<CreateReviewView> createState() => _CreateReviewViewState();
}

class _CreateReviewViewState extends State<CreateReviewView> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: "Leave A Review", actions: null),
      body: ListView(
        padding: EdgeInsets.fromLTRB(36, 16, 36, 120),
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/recipe/burger.png"),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: Center(
                    child: Text(
                      "Chicken Burger",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  padding: EdgeInsets.all(12),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                    color: AppColors.redPinkMain,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          BlocBuilder<CreateReviewBloc, CreateReviewState>(
            builder: (context, state) => Column(
              spacing: 3,
              children: [
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) {
                      return GestureDetector(
                        onTap: () => context.read<CreateReviewBloc>().add(
                              CreateReviewRate(currentIndex: index),
                            ),
                        child: SizedBox(
                          width: 29,
                          height: 29,
                          child: SvgPicture.asset(
                            "assets/icons/star-${index <= (state.currentIndex ?? -1) ? 'filled' : 'empty'}.svg",
                            colorFilter: ColorFilter.mode(
                                AppColors.redPinkMain, BlendMode.srcIn),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'Your overall rating',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            minLines: 3,
            maxLines: 5,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Leave us Review",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.45),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: AppColors.pink,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          Row(
            children: [
              IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.pink,
                    padding: EdgeInsets.zero,
                  ),
                  color: AppColors.redPinkMain,
                  onPressed: () async => context
                      .read<CreateReviewBloc>()
                      .add(CreateReviewPickImage()),
                  iconSize: 30,
                  icon: Icon(Icons.add)),
              Text('Add Photo')
            ],
          ),
          BlocBuilder<CreateReviewBloc, CreateReviewState>(
            builder: (context, state) {
              if (state.pickedImage != null) {
                return Image.file(state.pickedImage!);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          Text('Do you ,recommend this recipe?'),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text('No'),
                  SizedBox(width: 7),
                  SvgPicture.asset('assets/icons/no.svg'),
                ],
              ),
              Row(
                children: [
                  Text('Yes'),
                  SizedBox(width: 7),
                  SvgPicture.asset('assets/icons/yes.svg')
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 158,
                height: 29,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'cancel',
                    style: TextStyle(
                      color: AppColors.redPinkMain,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              BlocBuilder<CreateReviewBloc, CreateReviewState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<CreateReviewBloc>().add(PostReviewEvent(
                          rating: state.currentIndex!,
                          comment: _commentController.text.trim(),
                          file: state.pickedImage!,
                          recipeId: 2));
                    },
                    child: Container(
                      width: 158,
                      height: 29,
                      decoration: BoxDecoration(
                        color: AppColors.redPinkMain,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: CategoriesBottomNavBar(),
    );
  }
}
