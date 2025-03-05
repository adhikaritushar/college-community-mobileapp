// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class StudentGetDetilsParams {
  final String? baranch;
  final String? semester;
  final int? enrollmentNo;

  StudentGetDetilsParams({
    this.baranch,
    this.semester,
    this.enrollmentNo,
  });
}

class StudentAddDetailParams {
  final String firstName;
  final String middleName;
  final String lastName;
  final String enrollmentNo;
  final String email;
  final String phoneNumber;
  final String semester;
  final String branch;
  final String gender;
  final String? type;
  final File? profile;
  final String? id;

  StudentAddDetailParams({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.enrollmentNo,
    required this.email,
    required this.phoneNumber,
    required this.semester,
    required this.branch,
    required this.gender,
    this.type,
    this.profile,
    this.id,
  });
}
