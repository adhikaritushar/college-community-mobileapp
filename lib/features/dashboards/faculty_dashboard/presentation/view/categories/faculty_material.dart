import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/common_widgets/k_title.dart';
import 'package:college_community/core/utils/image_picker.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/faculty_dashboard_screen.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:college_community/features/material/presentation/view_model.dart/cubit/material_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';

class FacultyMatrial extends StatefulWidget {
  const FacultyMatrial({super.key});

  @override
  State<FacultyMatrial> createState() => _FacultyMatrialState();
}

class _FacultyMatrialState extends State<FacultyMatrial> {
  final TextEditingController _materialTitle = TextEditingController();
  String? selectedSubject;
  File? selectedFile;
  @override
  void initState() {
    super.initState();
    _materialTitle.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _materialTitle.dispose();
  }

  final _formKey = GlobalKey<FormState>();
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
      appBar: const KAppBar(title: "Upload Material"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const KTitle(title: "Upload Material"),
                const SizedBox(height: 20),
                KTextFormField(
                  controller: _materialTitle,
                  label: "Material Title",
                  validator: (value) => value!.isEmpty ? "Material title is required" : null,
                ),
                const SizedBox(height: 16),
                BlocBuilder<SubjectCubit, SubjectState>(
                  builder: (context, state) {
                    return KDropdownButton(
                      label: "Material Subject",
                      validator: (value) => value == null || value.isEmpty ? "Material Subjct is required" : null,
                      items: state.subjectList.map((e) => e.name).whereType<String>().toList(),
                      selectedValue: selectedSubject,
                      onChanged: (value) {
                        setState(() {
                          selectedSubject = value;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton.icon(
                      onPressed: _pickFile,
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Select Material"),
                      style: OutlinedButton.styleFrom(
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
                const SizedBox(height: 40),
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
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                const SizedBox(height: 40),
                BlocListener<MaterialsCubit, MaterialsState>(
                  listener: (context, state) {
                    if (state.isSuccessState) {
                      setState(() {
                        selectedSubject = "";
                        selectedFile = null;
                        _fileError = null;
                        _formKey.currentState?.reset();
                      });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FacultyDashboardScreen()));
                    }
                  },
                  child: KElevatedButton(
                    label: "Add Material",
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (selectedFile == null) {
                          setState(() {
                            _fileError = "Please select a Material file";
                          });
                        } else {
                          context.read<MaterialsCubit>().addMaterial(
                              params: AddMaterialParams(
                                title: _materialTitle.text.trim(),
                                subject: selectedSubject.toString(),
                                materialFile: selectedFile ?? File(""),
                                type: "material",
                              ),
                              context);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
