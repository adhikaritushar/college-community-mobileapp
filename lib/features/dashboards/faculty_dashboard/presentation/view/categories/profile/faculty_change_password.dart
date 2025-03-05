import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacultyChangePassword extends StatefulWidget {
  const FacultyChangePassword({super.key});

  @override
  State<FacultyChangePassword> createState() => _FacultyChangePasswordState();
}

class _FacultyChangePasswordState extends State<FacultyChangePassword> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Change Password"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              KTextFormField(
                controller: _currentPasswordController,
                label: "Enter Current Passwrod",
                validator: (value) => value!.isEmpty ? "Current Password is required" : null,
              ),
              const SizedBox(height: 16),
              KTextFormField(
                controller: _newPasswordController,
                label: "Enter New Password ",
                validator: (value) => value!.isEmpty ? "New Password is required" : null,
              ),
              const SizedBox(height: 40),
              Center(
                child: KElevatedButton(
                  label: "Change Password",
                  onPressed: () async {
                    LoginResponseModel? userLoginId = await AuthLocalService.getAuthLocalServie();

                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().facultyChangePassword(
                            changePasswrod: LoginParams(
                              loginID: _currentPasswordController.text.trim(),
                              password: _newPasswordController.text.trim(),
                              id: userLoginId?.id,
                            ),
                            context: context,
                          );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
