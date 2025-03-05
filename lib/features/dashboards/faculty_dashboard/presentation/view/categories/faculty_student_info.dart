import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacultyStudentInfo extends StatefulWidget {
  const FacultyStudentInfo({super.key});

  @override
  State<FacultyStudentInfo> createState() => _FacultyStudentInfoState();
}

class _FacultyStudentInfoState extends State<FacultyStudentInfo> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    isSearching = false;
    _searchController.clear();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Faculty Student Info"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: KTextFormField(
                      keyboardType: TextInputType.number,
                      controller: _searchController,
                      label: "Employee ID",
                      validator: (value) => value!.isEmpty ? "Employee ID is required" : null,
                      onClear: () {
                        setState(() {
                          _searchController.clear();
                          isSearching = false;
                        });
                      },
                    ),
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
            Expanded(
              child: (isSearching)
                  ? BlocBuilder<StudentCubit, StudentState>(
                      builder: (context, state) {
                        return state.studentData.isEmpty
                            ? const Center(
                                child: Text("No Data Found!!"),
                              )
                            : ListView.builder(
                                itemCount: state.studentData.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final user = state.studentData[index];
                                  return Container(
                                    padding: const EdgeInsets.all(16),
                                    margin: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${user.firstName} ${user.lastName}",
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  ClipOval(
                                                    child: CachedNetworkImage(
                                                      imageUrl: "${ApiEndpoint.baseURL}/media/${user.profile}",
                                                      fit: BoxFit.cover,
                                                      width: 40,
                                                      height: 40,
                                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              infoText("Enrollment No:", "${user.enrollmentNo}"),
                                              infoText("Phone Number:", "${user.phoneNumber}"),
                                              infoText("Email Address:", "${user.email}"),
                                              infoText("Branch:", "${user.branch}"),
                                              infoText("Semester:", "${user.semester}"),
                                            ],
                                          ),
                                        ),
                                        // Image Section
                                      ],
                                    ),
                                  );
                                },
                              );
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: "$label ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
