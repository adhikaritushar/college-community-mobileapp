import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/utils/image_picker.dart';
import 'package:college_community/features/admin/domain/entities/request/admin_add_detail_params.dart';
import 'package:college_community/features/admin/presentation/view_model.dart/cubit/admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminEditScreen extends StatefulWidget {
  const AdminEditScreen({super.key});

  @override
  State<AdminEditScreen> createState() => _AdminEditScreenState();
}

class _AdminEditScreenState extends State<AdminEditScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _enrollmentController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberlController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      appBar: const KAppBar(title: "Edit Admin"),
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
                        context.read<AdminCubit>().adminGetDetials(
                              context: context,
                              employeeId: _searchController.text.trim(),
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
                    ? BlocConsumer<AdminCubit, AdminState>(
                        listener: (context, state) {
                          if (state.isSuccessState) {}
                        },
                        builder: (context, state) {
                          if (state.isLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state.adminData!.isEmpty) {
                            return const Text("No Admin found");
                          }

                          _firstNameController.text = state.adminData![0].firstName.toString();
                          _middleNameController.text = state.adminData![0].middleName.toString();
                          _lastNameController.text = state.adminData![0].lastName.toString();
                          _enrollmentController.text = state.adminData![0].employeeId.toString();
                          _emailAddressController.text = state.adminData![0].email.toString();
                          _phoneNumberlController.text = state.adminData![0].phoneNumber.toString();
                          selectedGender = state.adminData![0].gender?.isNotEmpty == true ? state.adminData![0].gender![0].toUpperCase() + state.adminData![0].gender!.substring(1) : '';

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
                                    controller: _enrollmentController,
                                    label: "Enter Enrollment No.",
                                    validator: (value) => value!.isEmpty ? "Enrollment No. is required" : null,
                                  ),
                                  const SizedBox(height: 16),
                                  KTextFormField(
                                    controller: _emailAddressController,
                                    label: "Enter Email Address",
                                    validator: (value) => value!.isEmpty ? "Email Address is required" : null,
                                  ),
                                  const SizedBox(height: 16),
                                  KTextFormField(
                                    controller: _phoneNumberlController,
                                    label: "Enter Phone Number",
                                    validator: (value) => value!.isEmpty ? "Phone Number is required" : null,
                                  ),
                                  const SizedBox(height: 16),
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
                                                    if (state.adminData![0].profile!.endsWith(".jpg") || state.adminData![0].profile!.endsWith(".png"))
                                                      CachedNetworkImage(
                                                        imageUrl: "${ApiEndpoint.baseURL}/media/${state.adminData![0].profile}",
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
                                                            state.adminData![0].profile!.split('/').last,
                                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          Text(
                                                            state.adminData![0].profile!.split('.').last.toUpperCase(),
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
                                    label: "Update Admin",
                                    onPressed: () {
                                      context.read<AdminCubit>().updateAdmin(
                                            params: AdminAddDetailParams(
                                              id: state.adminData![0].id,
                                              firstName: _firstNameController.text,
                                              middleName: _middleNameController.text,
                                              lastName: _lastNameController.text,
                                              employeeId: int.tryParse(_enrollmentController.text.trim()) ?? 0,
                                              email: _emailAddressController.text,
                                              phoneNumber: _phoneNumberlController.text,
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
