class ReviewCommentUserModel{
  final int id;
  final String profilePhoto,username;

  ReviewCommentUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
  });

  factory ReviewCommentUserModel.fromJson(Map<String, dynamic> json) {
    return ReviewCommentUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
    );
  }
}
