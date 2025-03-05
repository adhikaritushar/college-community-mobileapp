// ignore_for_file: public_member_api_docs, sort_constructors_first
class FacultyEntity {
  final String? id;
  final int? employeeId;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final int? phoneNumber;
  final String? department;
  final String? gender;
  final int? experience;
  final String? post;
  final String? profile;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  FacultyEntity({
    this.id,
    this.employeeId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.department,
    this.gender,
    this.experience,
    this.post,
    this.profile,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @override
  String toString() {
    return 'FacultyEntity(id: $id, employeeId: $employeeId, firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, department: $department, gender: $gender, experience: $experience, post: $post, profile: $profile, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant FacultyEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.employeeId == employeeId &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.department == department &&
        other.gender == gender &&
        other.experience == experience &&
        other.post == post &&
        other.profile == profile &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        employeeId.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        department.hashCode ^
        gender.hashCode ^
        experience.hashCode ^
        post.hashCode ^
        profile.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
