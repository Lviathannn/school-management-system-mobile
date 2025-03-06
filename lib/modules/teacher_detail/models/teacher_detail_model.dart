// ignore_for_file: non_constant_identifier_names

import 'package:school_management_system/modules/home/models/student_model.dart';

class TeacherDetailModel {
  final int id;
  final String nik;
  final String nip;
  final String name;
  final String contact;
  final String address;
  final String degree;
  final String gender;
  final String role;
  final DateTime birth_date;
  final String birth_place;
  final ProfilePicture? profile_picture;
  final List<Attachment> attachment;

  TeacherDetailModel({
    required this.id,
    required this.nik,
    required this.nip,
    required this.name,
    required this.contact,
    required this.address,
    required this.degree,
    required this.gender,
    required this.role,
    required this.birth_date,
    required this.birth_place,
    required this.attachment,
    this.profile_picture,
  });

  factory TeacherDetailModel.fromJson(Map<String, dynamic> json) {
    return TeacherDetailModel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      role: json['role'],
      birth_date: DateTime.parse(json['birth_date']),
      address: json['address'],
      degree: json['degree'],
      contact: json['contact'],
      birth_place: json['birth_place'],
      nik: json['nik'],
      nip: json['nip'],
      attachment: List<Attachment>.from(
          json['attachment'].map((x) => Attachment.fromJson(x))),
      profile_picture: json['profile_picture'] != null
          ? ProfilePicture.fromJson(json['profile_picture'])
          : null,
    );
  }
}

class Attachment {
  final String url;
  final String type;

  Attachment({
    required this.url,
    required this.type,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      url: json['url'],
      type: json['type'],
    );
  }
}
