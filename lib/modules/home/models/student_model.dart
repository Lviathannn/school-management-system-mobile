// ignore_for_file: non_constant_identifier_names

class StudentModel {
  final int id;
  final String name;
  final DateTime birth_date;
  final String address;
  final String parent;
  final String contact;
  final String student_class;
  final String birth_place;
  final String nik;
  final String nis;
  final String gender;

  StudentModel({
    required this.id,
    required this.name,
    required this.birth_date,
    required this.address,
    required this.parent,
    required this.contact,
    required this.student_class,
    required this.birth_place,
    required this.nik,
    required this.nis,
    required this.gender,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      birth_date: DateTime.parse(json['birth_date']),
      address: json['address'],
      parent: json['parent'],
      contact: json['contact'],
      student_class: json['student_class'],
      birth_place: json['birth_place'],
      nik: json['nik'],
      nis: json['nis'],
    );
  }
}
