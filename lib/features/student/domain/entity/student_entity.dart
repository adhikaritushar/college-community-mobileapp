class StudentEntity {
  final String? id;
  final int? enrollmentNo;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final int? phoneNumber;
  final int? semester;
  final String? branch;
  final String? gender;
  final String? profile;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  StudentEntity({
    this.id,
    this.enrollmentNo,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.semester,
    this.branch,
    this.gender,
    this.profile,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  StudentEntity copyWith({
    String? id,
    int? enrollmentNo,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    int? phoneNumber,
    int? semester,
    String? branch,
    String? gender,
    String? profile,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return StudentEntity(
      id: id ?? this.id,
      enrollmentNo: enrollmentNo ?? this.enrollmentNo,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      semester: semester ?? this.semester,
      branch: branch ?? this.branch,
      gender: gender ?? this.gender,
      profile: profile ?? this.profile,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'StudentEntity(id: $id, enrollmentNo: $enrollmentNo, firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, semester: $semester, branch: $branch, gender: $gender, profile: $profile, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant StudentEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.enrollmentNo == enrollmentNo &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.semester == semester &&
        other.branch == branch &&
        other.gender == gender &&
        other.profile == profile &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        enrollmentNo.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        semester.hashCode ^
        branch.hashCode ^
        gender.hashCode ^
        profile.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
