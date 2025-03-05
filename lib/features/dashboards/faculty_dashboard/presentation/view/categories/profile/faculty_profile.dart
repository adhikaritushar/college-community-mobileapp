import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/profile/faculty_change_password.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view_model/cubit/faculty_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacultyProfile extends StatelessWidget {
  const FacultyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<FacultyDashboardCubit, FacultyDashboardState>(
          builder: (context, state) {
            final user = state.userData[0];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blueAccent, width: 3),
                      image: DecorationImage(
                        image: NetworkImage("${ApiEndpoint.baseURL}/media/${user.profile}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // User Information Boxes
                _buildInfoBox("Name", "${user.firstName} ${user.lastName}"),
                _buildInfoBox("Employee Id", user.employeeId.toString()),
                _buildInfoBox("Post", user.post.toString()),
                _buildInfoBox("Department", user.department.toString()),
                _buildInfoBox("Phone Number", user.phoneNumber.toString()),
                _buildInfoBox("Email Address", user.email.toString()),
                const SizedBox(height: 20),
                KElevatedButton(
                  label: "Change Password",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyChangePassword()));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.shade200, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
