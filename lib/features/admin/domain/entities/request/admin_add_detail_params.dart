import 'dart:io';

class AdminAddDetailParams {
  final int employeeId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String gender;
  final String? type;
  final File? profile;
  final String? id; // for updating user

  AdminAddDetailParams({
    required this.employeeId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    this.type,
    this.profile,
    this.id,
  });
}
