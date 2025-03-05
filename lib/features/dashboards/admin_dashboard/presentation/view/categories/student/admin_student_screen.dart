import 'dart:io';

import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/common_widgets/k_title.dart';
import 'package:college_community/core/constant/app_name.dart';
import 'package:college_community/core/utils/image_picker.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/student/edit_student_screen.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/helpers/faculty_helpers.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminStudentScreen extends StatefulWidget {
  const AdminStudentScreen({super.key});

  @override
  State<AdminStudentScreen> createState() => _AdminStudentScreenState();
}

class _AdminStudentScreenState extends State<AdminStudentScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _enrollmentController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberlController = TextEditingController();

  _clear() {
    _firstNameController.clear();
    _lastNameController.clear();
    _middleNameController.clear();
    _enrollmentController.clear();
    _emailAddressController.clear();
    _phoneNumberlController.clear();
    selectedSemester = null;
    selectedBranch = null;
    selectedGender = null;
    selectedFile = null;
  }

  @override
  void initState() {
    super.initState();
    _clear();
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _middleNameController.dispose();
    _enrollmentController.dispose();
    _emailAddressController.dispose();
    _phoneNumberlController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  String? selectedSemester;
  String? selectedBranch;
  String? selectedGender;
  File? selectedFile;
  String? _fileError;

  Future<void> _pickFile() async {
    final List<File> files = await FileHelper.pickFiles(allowedExtensions: ['jpg', 'png', 'pdf']);
    if (files.isNotEmpty) {
      setState(() {
        selectedFile = files.first;
        _fileError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Student"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTitle(context),
                const SizedBox(height: 30),
                KTextFormField(
                  controller: _firstNameController,
                  label: "Enter First Name",
                  validator: (value) => value!.isEmpty ? "First Name is required" : null,
                ),
                const SizedBox(height: 16),
                KTextFormField(
                  controller: _middleNameController,
                  label: "Enter Middle Name ",
                  validator: (value) => value!.isEmpty ? "Middle Name is required" : null,
                ),
                const SizedBox(height: 16),
                KTextFormField(
                  controller: _lastNameController,
                  label: "Enter Last Name",
                  validator: (value) => value!.isEmpty ? "Last Name is required" : null,
                ),
                const SizedBox(height: 16),
                KTextFormField(
                  keyboardType: TextInputType.number,
                  controller: _enrollmentController,
                  label: "Enter Enrollment No.",
                  validator: (value) => value!.isEmpty ? "Enrollment No. is required" : null,
                ),
                const SizedBox(height: 16),
                KTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailAddressController,
                  label: "Enter Email Address",
                  validator: (value) => value!.isEmpty ? "Email Address is required" : null,
                ),
                const SizedBox(height: 16),
                KTextFormField(
                  keyboardType: TextInputType.number,
                  controller: _phoneNumberlController,
                  label: "Enter Phone Number",
                  validator: (value) => value!.isEmpty ? "Phone Number is required" : null,
                ),
                const SizedBox(height: 16),
                KDropdownButton(
                  label: "Select Semester",
                  validator: (value) => value == null || value.isEmpty ? "Semester is required" : null,
                  items: semestersList,
                  selectedValue: selectedSemester,
                  onChanged: (value) {
                    setState(() {
                      selectedSemester = value;
                    });
                  },
                ),
                BlocBuilder<BranchCubit, BranchState>(
                  builder: (context, state) {
                    if (state.isLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return KDropdownButton(
                      label: "Select Branch",
                      validator: (value) => value == null || value.isEmpty ? "Branch is required" : null,
                      items: state.branchList.map((e) => e.name).whereType<String>().toList(),
                      selectedValue: selectedBranch,
                      onChanged: (value) {
                        setState(() {
                          selectedBranch = value;
                        });
                      },
                    );
                  },
                ),
                KDropdownButton(
                  label: "Select Gender",
                  validator: (value) => value == null || value.isEmpty ? "Gender is required" : null,
                  items: const ["Male", "Female"],
                  selectedValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton.icon(
                      onPressed: _pickFile,
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Select Profile"),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        minimumSize: const Size(double.infinity, 50),
                        foregroundColor: Colors.black,
                      ),
                    ),
                    if (_fileError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _fileError!,
                          style: const TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                if (selectedFile != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            if (selectedFile!.path.endsWith(".jpg") || selectedFile!.path.endsWith(".png"))
                              Image.file(
                                selectedFile!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                            else
                              const Icon(
                                Icons.file_present,
                                size: 50,
                                color: Colors.blue,
                              ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedFile!.path.split('/').last,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    selectedFile!.path.split('.').last.toUpperCase(),
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                KElevatedButton(
                  label: "Add New Student",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedFile == null) {
                        setState(() {
                          _fileError = "Please select a Profile";
                        });
                      } else {
                        context.read<StudentCubit>().studentAddDetials(
                              params: StudentAddDetailParams(
                                firstName: _firstNameController.text,
                                middleName: _middleNameController.text,
                                lastName: _lastNameController.text,
                                enrollmentNo: _enrollmentController.text,
                                email: _emailAddressController.text,
                                phoneNumber: _phoneNumberlController.text,
                                semester: getSemesterValue(selectedSemester.toString()),
                                branch: selectedBranch.toString(),
                                gender: selectedGender.toString(),
                                type: "profile",
                                profile: selectedFile,
                              ),
                              context: context,
                            );
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const KTitle(title: "Add Student Details"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditStudentScreen()));
          },
          child: const Text("Edit Student", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
