class RecipeHomeModel {
  final int id, categoryId;
  final String title, description;
  final String photo;
  final int timeRequired;

  final num rating;

  RecipeHomeModel(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.description,
      required this.photo,
      required this.rating,
      required this.timeRequired});

  factory RecipeHomeModel.fromJson(Map<String, dynamic> json) {
    return RecipeHomeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
    );
  }
}
