import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/utils/pdf_opener.dart';
import 'package:college_community/features/material/presentation/view_model.dart/cubit/material_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StudentMaterials extends StatefulWidget {
  const StudentMaterials({super.key});

  @override
  State<StudentMaterials> createState() => _StudentMaterialsState();
}

class _StudentMaterialsState extends State<StudentMaterials> {
  String? selectedMaterial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Student Materials"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<SubjectCubit, SubjectState>(
              builder: (context, state) {
                if (state.isLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.subjectList.isEmpty) {
                  return const Center(child: Text("No materials available."));
                }

                return KDropdownButton(
                  label: "Select Subject",
                  validator: (value) => value == null || value.isEmpty ? "Branch is required" : null,
                  items: state.subjectList.map((e) => e.name).whereType<String>().toList(),
                  selectedValue: selectedMaterial,
                  onChanged: (value) {
                    setState(() {
                      selectedMaterial = value;
                    });
                    context.read<MaterialsCubit>().getMaterial(subject: selectedMaterial.toString(), context);
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            if (selectedMaterial != null)
              BlocBuilder<MaterialsCubit, MaterialsState>(
                builder: (context, state) {
                  if (state.isLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return state.materialList.isEmpty
                      ? const Center(
                          child: Text(
                            "No Data Found!!",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )
                      : ListView.separated(
                          itemCount: state.materialList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = state.materialList[index];
                            return GestureDetector(
                              onTap: () {
                                openPdfFromUrl("${ApiEndpoint.baseURL}/media/${data.link}");
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadowColor: Colors.blueAccent.withOpacity(0.3),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.title.toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueAccent,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              maxLines: 1,
                                              "${data.subject.toString()} - ${data.faculty}",
                                              style: AppTextStyle.textStyle(
                                                context: context,
                                                fontSize: 12,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                size: 18,
                                                color: Colors.grey[500],
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(data.createdAt.toString())),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                        );
                },
              )
          ],
        ),
      ),
    );
  }
}
