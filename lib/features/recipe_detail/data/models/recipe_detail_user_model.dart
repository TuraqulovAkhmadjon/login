class RecipeDetailUserModel {
  final int id;
  final String profilePhoto, firstname, lastname, username;

  RecipeDetailUserModel({
    required this.id,
    required this.profilePhoto,
    required this.firstname,
    required this.lastname,
    required this.username,
  });

  factory RecipeDetailUserModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailUserModel(
        id: json["id"],
        profilePhoto: json["profilePhoto"],
        firstname: json["firstName"],
        lastname: json["lastName"],
        username: json["username"]);
  }
}
