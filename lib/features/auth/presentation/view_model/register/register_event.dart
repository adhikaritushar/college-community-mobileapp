import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String course;
  final String department;

  RegisterSubmitted({
    required this.name,
    required this.email,
    required this.password,
    required this.course,
    required this.department,
  });

  @override
  List<Object?> get props => [name, email, password, course, department];
}
