import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewSubjectScreen extends StatelessWidget {
  const ViewSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Subject"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SubjectCubit, SubjectState>(
          builder: (_, state) {
            if (state.isLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.separated(
              itemCount: state.subjectList.length,
              itemBuilder: (_, index) {
                final branch = state.subjectList[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "${branch.name}",
                          style: AppTextStyle.textStyle(context: context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<SubjectCubit>().deleteSubject(id: state.subjectList[index].id.toString(), context: context);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            );
          },
        ),
      ),
    );
  }
}
