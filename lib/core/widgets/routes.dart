class Routes{

  static  String review="/reviews/:recipeId";
  static  String createReview="/create-review/:recipeId";
  static String getReview(int recipeId)=>'/reviews/$recipeId';
  static String getCreateReview(int recipeId)=> '/create-review/$recipeId';
}