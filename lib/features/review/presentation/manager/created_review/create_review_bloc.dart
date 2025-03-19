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
    on<UpdateApprovalStatus>(_onUpdateApprovalStatus);
    on<PostReviewEvent>(_postReviewComment);
  }

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

  Future<void> _onUpdateApprovalStatus(
      UpdateApprovalStatus event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(isApproved: event.isApproved));
  }

  Future<void> _postReviewComment(
      PostReviewEvent event, Emitter<CreateReviewState> emit) async {
    final result = await _recipeRepo.postReviewComment(
        event.recipeId, event.comment, event.rating, event.file);
    if (result) {
      emit(state.copyWith(status: CreateReviewStatus.idle));
    } else {
      emit(state.copyWith(status: CreateReviewStatus.error));
    }
  }
}
