import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/features/review/presentation/manager/created_review/create_review_state.dart';

import '../../../data/repositories/review_repository.dart';

part 'create_review_events.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  final ReviewsRepository _recipeRepo;

  CreateReviewBloc({required ReviewsRepository recipeRepo})
      : _recipeRepo = recipeRepo,
        super(
          CreateReviewState.initial(),
        ) {
    on<CreateReviewRate>(_onRate);
    on<CreateReviewPickImage>(_onPickImage);

  }
  // Future _onLoad(CreateReviewLoading event,Emitter<CreateReviewState>emit)async{
  //   emit(state.copyWith(status: CreateReviewStatus.loading,recipeId: event.recipeId));
  //   final recipe = await
  // }

  Future<void> _onRate(
      CreateReviewRate event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(
        currentIndex: event.currentIndex, status: CreateReviewStatus.idle));
  }

  Future<void> _onPickImage(
      CreateReviewPickImage event, Emitter<CreateReviewState> emit) async {
    File? image;
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(state.copyWith(pickedImage: image));
    }
  }


}
