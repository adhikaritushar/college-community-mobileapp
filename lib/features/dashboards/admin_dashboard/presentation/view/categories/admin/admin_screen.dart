import 'dart:io';

import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/common_widgets/k_title.dart';
import 'package:college_community/core/utils/image_picker.dart';
import 'package:college_community/features/admin/domain/entities/request/admin_add_detail_params.dart';
import 'package:college_community/features/admin/presentation/view_model.dart/cubit/admin_cubit.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/admin/admin_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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
      appBar: const KAppBar(title: "Admin"),
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
                  label: "Add New Admin",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedFile == null) {
                        setState(() {
                          _fileError = "Please select a Profile";
                        });
                      } else {
                        context.read<AdminCubit>().adminAddDetials(
                              params: AdminAddDetailParams(
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
        const KTitle(title: "Add Admin Details"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminEditScreen()));
          },
          child: const Text("Edit Admin", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
