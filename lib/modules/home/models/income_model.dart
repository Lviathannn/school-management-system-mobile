// ignore_for_file: non_constant_identifier_names

class IncomeModel {
  final DateTime created_at;
  final String description;
  final String teacher;
  final int total;
  final String type;

  IncomeModel({
    required this.created_at,
    required this.description,
    required this.teacher,
    required this.total,
    required this.type,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      created_at: DateTime.parse(json['created_at']),
      description: json['description'],
      teacher: json['teacher']['name'],
      total: json['total'],
      type: json['type'],
    );
  }
}
