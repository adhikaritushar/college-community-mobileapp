import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_title.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_add_notice.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_edit_notice.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AdminNotice extends StatelessWidget {
  const AdminNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Admin Notice"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<NoticeCubit, NoticeState>(
                builder: (context, state) {
                  if (state.isLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.noteList.length,
                    itemBuilder: (context, index) {
                      final data = state.noteList[index];
                      return _buildNoticeCard(context, noticedata: data);
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const KTitle(title: "Notice"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyAddNotice()));
          },
          child: const Text("Create Note", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildNoticeCard(BuildContext context, {required NoticeEntity noticedata}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noticedata.title.toString(),
                    style: AppTextStyle.textStyle(context: context, fontSize: 18, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    noticedata.description.toString(),
                    style: AppTextStyle.textStyle(context: context, fontSize: 14, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm:ss').format(
                          DateTime.parse(noticedata.createdAt.toString()),
                        ),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryTag(context, noticedata.type.toString()),
                ],
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 40,
              child: _buildPopupMenu(noticedata: noticedata),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTag(BuildContext context, String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.blue.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          text,
          style: AppTextStyle.textStyle(context: context, fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPopupMenu({required NoticeEntity noticedata}) {
    return PopupMenuButton<int>(
      color: Colors.blue.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FacultyEditNotice(noticedata: noticedata)));
          },
          value: 1,
          child: const Row(
            children: [
              Icon(Icons.edit, size: 18, color: Colors.blue),
              SizedBox(width: 8),
              Text("Edit", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        PopupMenuItem<int>(
          onTap: () {
            context.read<NoticeCubit>().deleteNotice(id: noticedata.id.toString(), context: context);
          },
          value: 2,
          child: const Row(
            children: [
              Icon(Icons.delete, size: 18, color: Colors.red),
              SizedBox(width: 8),
              Text("Delete", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
