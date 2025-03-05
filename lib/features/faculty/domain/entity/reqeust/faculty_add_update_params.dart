// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class FacultyAddUpdateParams {
  final int employeeId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String department;
  final int experience;
  final String gender;
  final String post;
  final String type;
  final File? profile;
  final String? id;

  FacultyAddUpdateParams({
    required this.employeeId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.department,
    required this.experience,
    required this.gender,
    required this.post,
    required this.type,
    required this.profile,
    this.id,
  });
}
