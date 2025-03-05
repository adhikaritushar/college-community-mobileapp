import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/utils/pdf_opener.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:college_community/features/timetable/presentation/view_model/cubit/timetable_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentTimetable extends StatelessWidget {
  const StudentTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Student Timetable"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<StudentCubit, StudentState>(
                  builder: (context, state) {
                    if (state.isLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Text(
                      "TimeTable of Semester ${state.studentData[0].semester}",
                      style: AppTextStyle.textStyle(
                        context: context,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                BlocBuilder<TimetableCubit, TimetableState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        openPdfFromUrl("${ApiEndpoint.baseURL}/media/${state.timetableList[0].link}");
                      },
                      icon: const Icon(Icons.download, size: 24),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Timetable List
            Expanded(
              child: BlocBuilder<StudentCubit, StudentState>(
                builder: (context, studentState) {
                  return BlocBuilder<TimetableCubit, TimetableState>(
                    builder: (context, state) {
                      return state.timetableList.isEmpty
                          ? const Center(
                              child: Text("No Data Found !!", style: TextStyle(fontSize: 16)),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                final userSemester = studentState.studentData[index].semester;
                                final filteredTimetable = state.timetableList.where((timetable) => timetable.semester == userSemester).toList();

                                if (filteredTimetable.isEmpty) {
                                  return const SizedBox.shrink();
                                }

                                final data = filteredTimetable[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    shadowColor: Colors.blueAccent.withOpacity(0.3),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        imageUrl: "${ApiEndpoint.baseURL}/media/${data.link}",
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 250,
                                        placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(height: 16),
                            );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
