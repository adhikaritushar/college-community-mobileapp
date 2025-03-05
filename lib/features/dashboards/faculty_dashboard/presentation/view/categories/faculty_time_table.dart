import 'dart:io';

import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/constant/app_name.dart';
import 'package:college_community/core/utils/image_picker.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/helpers/faculty_helpers.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';
import 'package:college_community/features/timetable/presentation/view_model/cubit/timetable_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacultyTimeTable extends StatefulWidget {
  const FacultyTimeTable({super.key});

  @override
  State<FacultyTimeTable> createState() => _FacultyTimeTableState();
}

class _FacultyTimeTableState extends State<FacultyTimeTable> {
  String? selectedBranch;
  String? selectedSemester;
  File? selectedFile;

  final _formKey = GlobalKey<FormState>();
  String? _fileError;

  Widget _buildTitle() {
    return Row(
      children: [
        Container(height: 24, width: 5, color: Colors.red, margin: const EdgeInsets.only(right: 8)),
        const Text('Upload Timetable', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
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
      appBar: const KAppBar(title: "Upload Timetable"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(height: 20),
              BlocBuilder<BranchCubit, BranchState>(
                builder: (context, state) {
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
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton.icon(
                    onPressed: _pickFile,
                    icon: const Icon(Icons.upload_file),
                    label: const Text("Select Timetable"),
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
              const SizedBox(height: 40),
              BlocListener<TimetableCubit, TimetableState>(
                listener: (context, state) {
                  if (state.isSuccessState) {
                    setState(() {
                      selectedBranch = "";
                      selectedSemester = "";
                      selectedFile = null;
                      _fileError = null;
                      _formKey.currentState?.reset();
                    });
                  }
                },
                child: KElevatedButton(
                  label: "Add Timetable",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (selectedFile == null) {
                        setState(() {
                          _fileError = "Please select a timetable file";
                        });
                      } else {
                        context.read<TimetableCubit>().postTimetable(
                            params: PostTimetableParams(
                              branch: selectedBranch ?? "",
                              semester: getSemesterValue(selectedSemester.toString()),
                              type: "timetable",
                              timeTableFile: selectedFile ?? File(""),
                            ),
                            context: context);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
