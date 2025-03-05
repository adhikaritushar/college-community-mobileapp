import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/common_widgets/k_title.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/branch/view_branch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBranchScreen extends StatefulWidget {
  const AdminBranchScreen({super.key});

  @override
  State<AdminBranchScreen> createState() => _AdminBranchScreenState();
}

class _AdminBranchScreenState extends State<AdminBranchScreen> {
  final TextEditingController _branchNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _branchNameController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _branchNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Branch"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTitle(context),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: KTextFormField(
                        controller: _branchNameController,
                        label: "Enter Branch Name",
                        validator: (value) => value!.isEmpty ? "Branch Name is required" : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  BlocConsumer<BranchCubit, BranchState>(
                    listener: (context, state) {
                      if (state.isSuccessState) {
                        _branchNameController.clear();
                      }
                    },
                    builder: (context, state) {
                      return KElevatedButton(
                        isLoading: state.isLoadingState ? true : false,
                        label: "Add Branch",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<BranchCubit>().addBranch(branchName: _branchNameController.text.trim(), context: context);
                          }
                        },
                      );
                    },
                  )
                ],
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
        const KTitle(title: "Add Branch"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          onPressed: () {
            context.read<BranchCubit>().getBranch();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewBranchScreen()));
          },
          child: const Text("View Branches", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
