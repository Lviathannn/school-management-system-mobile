// ignore_for_file: non_constant_identifier_names

class SavingModel {
  final DateTime created_at;
  final String student;
  final String teacher;
  final int total;
  final String type;
  final String student_class;

  SavingModel({
    required this.created_at,
    required this.student,
    required this.teacher,
    required this.total,
    required this.type,
    required this.student_class,
  });

  factory SavingModel.fromJson(Map<String, dynamic> json) {
    return SavingModel(
      created_at: DateTime.parse(json['created_at']),
      student: json['student']['name'],
      student_class: json['student']['student_class'],
      teacher: json['teacher']['name'],
      total: json['total'],
      type: json['type'],
    );
  }
}
