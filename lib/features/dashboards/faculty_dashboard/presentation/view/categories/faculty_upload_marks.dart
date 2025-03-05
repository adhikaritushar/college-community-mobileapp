// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/constant/app_name.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/helpers/faculty_helpers.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacultyUploadMarks extends StatefulWidget {
  const FacultyUploadMarks({super.key});

  @override
  State<FacultyUploadMarks> createState() => _FacultyUploadMarksState();
}

class _FacultyUploadMarksState extends State<FacultyUploadMarks> {
  String? selectedBranch;
  String? selectedSemester;
  String? selectedSubject;
  String? selectedExamType;
  bool isUploadMark = false;

  final TextEditingController _marksController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> examTypes = ['Internal', 'External'];

  @override
  void dispose() {
    _marksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Upload Marks"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              const SizedBox(height: 16),
              BlocBuilder<StudentCubit, StudentState>(
                builder: (context, state) {
                  if (state.isSuccessState && isUploadMark && state.studentData.isNotEmpty) {
                    return _buildUploadStudentMarks(state.studentData[0].enrollmentNo.toString());
                  }
                  return _buildForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Container(height: 24, width: 5, color: Colors.red, margin: const EdgeInsets.only(right: 8)),
        const Text('Upload Marks', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<BranchCubit, BranchState>(
          builder: (context, state) {
            return _buildDropdown('Select Branch', state.branchList.map((e) => e.name).whereType<String>().toList(), selectedBranch, (value) => setState(() => selectedBranch = value));
          },
        ),
        _buildDropdown('Select Semester', semestersList, selectedSemester, (value) => setState(() => selectedSemester = value)),
        BlocBuilder<SubjectCubit, SubjectState>(
          builder: (context, state) {
            return _buildDropdown('Select Subject', state.subjectList.map((e) => e.name).whereType<String>().toList(), selectedSubject, (value) => setState(() => selectedSubject = value));
          },
        ),
        _buildDropdown('Select Exam Type', examTypes, selectedExamType, (value) => setState(() => selectedExamType = value)),
        const SizedBox(height: 24),
        Center(
          child: KElevatedButton(
            label: "Load Student Data",
            onPressed: () {
              context.read<StudentCubit>().studentGetDetials(
                  context: context,
                  params: StudentGetDetilsParams(
                      baranch: selectedBranch,
                      semester: getSemesterValue(
                        selectedSemester.toString(),
                      )));
              setState(() => isUploadMark = true);
            },
          ),
        )
      ],
    );
  }

  Widget _buildUploadStudentMarks(String enrollmentNo) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Enrollment No: $enrollmentNo", style: AppTextStyle.textStyle(context: context, color: Colors.white)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: KTextFormField(
                    controller: _marksController,
                    validator: (value) => value!.isEmpty ? "Marks is required" : null,
                    label: "Enter Marks",
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        BlocConsumer<MarksCubit, MarksState>(
          listener: (_, state) {
            if (state.isSuccessState) {
              Navigator.pop(context);
              setState(() => isUploadMark = false);
            }
          },
          builder: (context, state) {
            return Center(
              child: KElevatedButton(
                label: "Upload Student Marks",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<MarksCubit>().addMarks(
                          context,
                          params: AddMarksParams(
                            enrollmentNo: enrollmentNo,
                            examType: {selectedSubject!: _marksController.text.trim()},
                            isInternal: selectedExamType == "Internal",
                          ),
                        );
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String>? items, String? selectedValue, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KDropdownButton(label: label, items: items, selectedValue: selectedValue, onChanged: onChanged),
        ],
      ),
    );
  }
}
