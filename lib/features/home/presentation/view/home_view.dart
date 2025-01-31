// import 'package:college_community_main/core/common/snackbar/my_snackbar.dart';
// import 'package:college_community_main/features/home/presentation/view_model/home_cubit.dart';
// import 'package:college_community_main/features/home/presentation/view_model/home_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   final bool _isDarkTheme = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               // Logout code
//               showMySnackBar(
//                 context: context,
//                 message: 'Logging out...',
//                 color: Colors.red,
//               );

//                 context.read<HomeCubit>().logout(context);
//             },
//           ),
//           Switch(
//             value: _isDarkTheme,
//             onChanged: (value) {
//               // Change theme
//               // setState(() {
//               //   _isDarkTheme = value;
//               // });
//             },
//           ),
//         ],
//       ),
//       // body: _views.elementAt(_selectedIndex),
//       body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
//         return state.views.elementAt(state.selectedIndex);
//       }),
//       bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           return BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.dashboard),
//                 label: 'Dashboard',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.book),
//                 label: 'Course',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.group),
//                 label: 'Batch',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.account_circle),
//                 label: 'Account',
//               ),
//             ],
//             currentIndex: state.selectedIndex,
//             selectedItemColor: Colors.white,
//             onTap: (index) {
//               context.read<HomeCubit>().onTabTapped(index);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:college_community_main/core/common/snackbar/my_snackbar.dart';
// import 'package:college_community_main/features/home/presentation/view_model/home_cubit.dart';
// import 'package:college_community_main/features/home/presentation/view_model/home_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   final bool _isDarkTheme = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               // Logout code
//               showMySnackBar(
//                 context: context,
//                 message: 'Logging out...',
//                 color: Colors.blue,
//               );
//               context.read<HomeCubit>().logout(context);
//             },
//           ),
//           Switch(
//             value: _isDarkTheme,
//             onChanged: (value) {
//               // Change theme
//             },
//             activeColor: Colors.blue,
//           ),
//         ],
//       ),
//       body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
//         return state.views.elementAt(state.selectedIndex);
//       }),
//       bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           return BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.dashboard),
//                 label: 'Dashboard',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.book),
//                 label: 'Course',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.group),
//                 label: 'Batch',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.account_circle),
//                 label: 'Account',
//               ),
//             ],
//             currentIndex: state.selectedIndex,
//             selectedItemColor: Colors.blue,
//             unselectedItemColor: Colors.blue[200],
//             backgroundColor: Colors.blue[50],
//             onTap: (index) {
//               context.read<HomeCubit>().onTabTapped(index);
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:college_community_main/core/common/snackbar/my_snackbar.dart';
import 'package:college_community_main/features/home/presentation/view_model/home_cubit.dart';
import 'package:college_community_main/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout code
              showMySnackBar(
                context: context,
                message: 'Logging out...',
                color: Colors.blue,
              );
              context.read<HomeCubit>().logout(context);
            },
          ),
          Switch(
            value: _isDarkTheme,
            onChanged: (value) {
              // Change theme
            },
            activeColor: Colors.blue,
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return state.views.elementAt(state.selectedIndex);
      }),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.question_answer),
                label: 'Queries',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
            currentIndex: state.selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.blue[200],
            backgroundColor: Colors.blue[50],
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
          );
        },
      ),
    );
  }
}

