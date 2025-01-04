class BestStudentModel {
  final String name;
  final String imageUrl;
  final int score;
  final String gender;
  final String studentClass;

  BestStudentModel({
    required this.studentClass,
    required this.gender,
    required this.name,
    required this.imageUrl,
    required this.score,
  });

  factory BestStudentModel.fromJson(Map<String, dynamic> json) {
    return BestStudentModel(
      name: json['name'],
      studentClass: json['studentClass'],
      gender: json['gender'],
      imageUrl: json['imageUrl'],
      score: json['score'],
    );
  }
}
