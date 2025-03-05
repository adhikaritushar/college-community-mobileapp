// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAddNotice extends StatefulWidget {
  const AdminAddNotice({
    super.key,
  });

  @override
  State<AdminAddNotice> createState() => _AdminAddNoticeState();
}

class _AdminAddNoticeState extends State<AdminAddNotice> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Add Notice"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                KTextFormField(
                  controller: _titleController,
                  label: "Notice Title",
                  validator: (value) => value!.isEmpty ? "Notice Title is required" : null,
                ),
                const SizedBox(height: 20),
                KTextFormField(
                  minLines: 5,
                  maxLines: 5,
                  controller: _descController,
                  label: "Notice Description",
                  validator: (value) => value!.isEmpty ? "Notice Description is required" : null,
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
                  validator: (value) => (value == null || value.isEmpty) ? "Target Audience is required" : null,
                  selectedValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 40),
                KElevatedButton(
                  label: "Add Notice",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<NoticeCubit>().addNotice(
                            params: NoticeAddUpdateParams(
                              description: _descController.text.trim(),
                              link: _linkController.text.trim(),
                              title: _titleController.text.trim(),
                              type: selectedValue?.toLowerCase(),
                            ),
                            context: context,
                          );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
