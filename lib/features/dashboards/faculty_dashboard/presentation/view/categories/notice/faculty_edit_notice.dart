// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacultyEditNotice extends StatefulWidget {
  final NoticeEntity noticedata;
  const FacultyEditNotice({
    super.key,
    required this.noticedata,
  });

  @override
  State<FacultyEditNotice> createState() => _FacultyEditNoticeState();
}

class _FacultyEditNoticeState extends State<FacultyEditNotice> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _linkController;
  String selectedValue = "Both";

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.noticedata.title);
    _descController = TextEditingController(text: widget.noticedata.description);
    _linkController = TextEditingController(text: widget.noticedata.link);

    selectedValue = _capitalize(widget.noticedata.type) ?? "Both";
  }

  String? _capitalize(String? text) {
    if (text == null || text.isEmpty) return null;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Edit Notice"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              KTextFormField(
                controller: _titleController,
                label: "Notice Title",
              ),
              const SizedBox(height: 20),
              KTextFormField(
                minLines: 5,
                maxLines: 5,
                controller: _descController,
                label: "Notice Description",
              ),
              const SizedBox(height: 20),
              KTextFormField(
                controller: _linkController,
                label: "Notice Link",
              ),
              const SizedBox(height: 20),
              KDropdownButton(
                label: "Target Audience",
                items: const ["Both", "Student", "Faculty"],
                selectedValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value.toString();
                  });
                },
              ),
              const SizedBox(height: 40),
              KElevatedButton(
                label: "Update Notice",
                onPressed: () {
                  context.read<NoticeCubit>().updateNotice(
                      params: NoticeAddUpdateParams(
                        description: _descController.text.trim(),
                        id: widget.noticedata.id,
                        link: _linkController.text.trim(),
                        title: _titleController.text.trim(),
                        type: selectedValue.toLowerCase(),
                      ),
                      context: context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
