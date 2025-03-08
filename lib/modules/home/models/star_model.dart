// ignore_for_file: non_constant_identifier_names

class StarModel {
  final DateTime created_at;
  final String student;
  final String teacher;
  final String reason;

  StarModel({
    required this.created_at,
    required this.student,
    required this.teacher,
    required this.reason,
  });

  factory StarModel.fromJson(Map<String, dynamic> json) {
    return StarModel(
      created_at: DateTime.parse(json['created_at']),
      student: json['student']['name'],
      teacher: json['teacher']['name'],
      reason: json['reason'],
    );
  }
}
