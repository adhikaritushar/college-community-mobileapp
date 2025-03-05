import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/common_widgets/k_title.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/subject/view_subject_screen.dart';
import 'package:college_community/features/subject/domain/entity/request/add_subject_parms.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminSubjectScreen extends StatefulWidget {
  const AdminSubjectScreen({super.key});

  @override
  State<AdminSubjectScreen> createState() => _AdminSubjectScreenState();
}

class _AdminSubjectScreenState extends State<AdminSubjectScreen> {
  final TextEditingController _subjectCodeNameController = TextEditingController();
  final TextEditingController _subjectNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _subjectCodeNameController.clear();
    _subjectNameController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _subjectCodeNameController.dispose();
    _subjectNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Subject"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTitle(context),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    KTextFormField(
                      controller: _subjectCodeNameController,
                      label: "Enter Subject Code",
                      validator: (value) => value!.isEmpty ? "Subject Code is required" : null,
                    ),
                    const SizedBox(height: 20),
                    KTextFormField(
                      controller: _subjectNameController,
                      label: "Enter Subject Name",
                      validator: (value) => value!.isEmpty ? "Subject Name is required" : null,
                    ),
                    const SizedBox(height: 40),
                    BlocConsumer<SubjectCubit, SubjectState>(
                      listener: (context, state) {
                        if (state.isSuccessState) {
                          _subjectCodeNameController.clear();
                          _subjectNameController.clear();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      builder: (context, state) {
                        return KElevatedButton(
                          isLoading: state.isLoadingState ? true : false,
                          label: "Add Subject",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SubjectCubit>().addSubject(
                                    params: AddSubjectParms(
                                      code: _subjectCodeNameController.text.trim(),
                                      name: _subjectNameController.text.trim(),
                                    ),
                                    context: context,
                                  );
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const KTitle(title: "Add Subjects"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          onPressed: () {
            context.read<SubjectCubit>().getSubject();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewSubjectScreen()));
          },
          child: const Text("View Subjects", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
