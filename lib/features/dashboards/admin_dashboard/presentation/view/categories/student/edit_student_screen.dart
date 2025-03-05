import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/constant/app_name.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/utils/image_picker.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/helpers/faculty_helpers.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditStudentScreen extends StatefulWidget {
  const EditStudentScreen({super.key});

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _enrollmentController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberlController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedSemester;
  String? selectedBranch;
  String? selectedGender;
  File? selectedFile;
  String? _fileError;
  bool isSearching = false;

  _clear() {
    _firstNameController.clear();
    _lastNameController.clear();
    _middleNameController.clear();
    _enrollmentController.clear();
    _emailAddressController.clear();
    _phoneNumberlController.clear();
    _searchController.clear();
    selectedSemester = null;
    selectedBranch = null;
    selectedGender = null;
    selectedFile = null;
    isSearching = false;
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
    _searchController.dispose();
  }

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
      appBar: const KAppBar(title: "Edit Student"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: KTextFormField(
                      controller: _searchController,
                      label: "Enrollment No.",
                      validator: (value) => value!.isEmpty ? "Enrollment No. is required" : null,
                      onClear: () {
                        setState(() {
                          _searchController.clear();
                          _clear();
                          isSearching = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isSearching = true;
                        });
                        context.read<StudentCubit>().studentGetDetials(
                              context: context,
                              params: StudentGetDetilsParams(enrollmentNo: int.tryParse(_searchController.text.trim()) ?? 0),
                            );
                      }
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              Expanded(
                child: (isSearching)
                    ? BlocConsumer<StudentCubit, StudentState>(
                        listener: (context, state) {
                          if (state.isSuccessState) {}
                        },
                        builder: (context, state) {
                          if (state.isLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state.studentData.isEmpty) {
                            return const Text("No student found");
                          }

                          _firstNameController.text = state.studentData[0].firstName.toString();
                          _middleNameController.text = state.studentData[0].middleName.toString();
                          _lastNameController.text = state.studentData[0].lastName.toString();
                          _enrollmentController.text = state.studentData[0].enrollmentNo.toString();
                          _emailAddressController.text = state.studentData[0].email.toString();
                          _phoneNumberlController.text = state.studentData[0].phoneNumber.toString();
                          selectedSemester = getSemesterName(state.studentData[0].semester.toString());
                          selectedBranch = state.studentData[0].branch.toString();
                          selectedGender = state.studentData[0].gender?.isNotEmpty == true ? state.studentData[0].gender![0].toUpperCase() + state.studentData[0].gender!.substring(1) : '';

                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
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
                                      bool branchExists = state.branchList.any((branch) => branch.name == selectedBranch);

                                      if (!branchExists) {
                                        selectedBranch = null;
                                      }

                                      return KDropdownButton(
                                        label: "Select Branch",
                                        validator: (value) => value == null || value.isEmpty ? "Material Subjct is required" : null,
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
                                    validator: (value) => value == null || value.isEmpty ? "Material Subjct is required" : null,
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
                                        label: const Text("Select Timetable"),
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
                                  if (selectedFile == null)
                                    (isSearching && state.isSuccessState)
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                              elevation: 5,
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Row(
                                                  children: [
                                                    if (state.studentData[0].profile!.endsWith(".jpg") || state.studentData[0].profile!.endsWith(".png"))
                                                      CachedNetworkImage(
                                                        imageUrl: "${ApiEndpoint.baseURL}/media/${state.studentData[0].profile}",
                                                        placeholder: (context, url) => const CircularProgressIndicator(),
                                                        errorWidget: (context, url, error) => const Icon(Icons.error),
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
                                                            state.studentData[0].profile!.split('/').last,
                                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          Text(
                                                            state.studentData[0].profile!.split('.').last.toUpperCase(),
                                                            style: TextStyle(color: Colors.grey[600]),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : const Text("data"),
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
                                    label: "Update Student",
                                    onPressed: () {
                                      context.read<StudentCubit>().updateStudent(
                                            params: StudentAddDetailParams(
                                              id: state.studentData[0].id,
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
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
