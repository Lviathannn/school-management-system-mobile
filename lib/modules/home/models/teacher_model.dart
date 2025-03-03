// ignore_for_file: non_constant_identifier_names
import 'package:school_management_system/modules/home/models/student_model.dart';

class TeacherModel {
  final int id;
  final String nik;
  final String nip;
  final String name;
  final String contact;
  final String address;
  final String degree;
  final String gender;
  final DateTime birth_date;
  final String role;
  final String birth_place;
  final ProfilePicture? profile_picture;

  TeacherModel({
    required this.id,
    required this.nik,
    required this.nip,
    required this.name,
    required this.contact,
    required this.address,
    required this.degree,
    required this.gender,
    required this.birth_date,
    required this.birth_place,
    required this.role,
    this.profile_picture,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'],
      nik: json['nik'],
      nip: json['nip'],
      name: json['name'],
      contact: json['contact'],
      address: json['address'],
      degree: json['degree'],
      gender: json['gender'],
      birth_date: DateTime.parse(json['birth_date']),
      role: json['role'],
      birth_place: json['birth_place'],
      profile_picture: json['profile_picture'] != null
          ? ProfilePicture.fromJson(json['profile_picture'])
          : null,
    );
  }
}
