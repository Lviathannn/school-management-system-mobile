// ignore_for_file: non_constant_identifier_names

import 'package:school_management_system/modules/home/models/student_model.dart';

class StudentDetailModel {
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
  final ProfilePicture? profile_picture;
  final List<Attachment> attachment;

  StudentDetailModel({
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
    required this.attachment,
    this.profile_picture,
  });

  factory StudentDetailModel.fromJson(Map<String, dynamic> json) {
    return StudentDetailModel(
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
