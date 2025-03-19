class InstructionsModel {
  final String text;
  final int order;

  InstructionsModel({
    required this.text,
    required this.order,
  });

  factory InstructionsModel.fromJson(Map<String, dynamic> json) {
    return InstructionsModel(
      text: json["text"],
      order: json["order"],
    );
  }
}
