import 'dart:io';

import 'package:equatable/equatable.dart';

enum CreateReviewStatus { idle, loading, error }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;
  final bool isApproved;

  final File? pickedImage;

  const CreateReviewState({
    required this.recipeId,
    required this.currentIndex,
    required this.status,
    required this.isApproved,
    required this.pickedImage
  });

  factory CreateReviewState.initial(){
    return CreateReviewState(recipeId: null,
        currentIndex: null,
        pickedImage: null,
        isApproved: false,

        status: CreateReviewStatus.loading);
  }

  CreateReviewState copyWith({
    int? recipeId,
    int? currentIndex,
    CreateReviewStatus? status,
    File? pickedImage,
    bool? isApproved,
  }) {
    return CreateReviewState(
        recipeId: recipeId ?? this.recipeId,
        currentIndex: currentIndex ?? this.currentIndex,
        status: status ?? this.status,
        pickedImage: pickedImage ?? this.pickedImage,
        isApproved: isApproved?? this.isApproved
    );
  }

  @override
  List<Object?> get props => [recipeId, currentIndex, pickedImage, status];
}
