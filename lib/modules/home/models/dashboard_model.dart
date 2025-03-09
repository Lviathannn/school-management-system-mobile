class DashboardModel {
  final int totalStudents;
  final int totalTeachers;
  final int totalIncomes;

  DashboardModel({
    required this.totalStudents,
    required this.totalTeachers,
    required this.totalIncomes,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      totalStudents: json['totalStudents'],
      totalTeachers: json['totalTeachers'],
      totalIncomes: json['totalIncomes'],
    );
  }
}
