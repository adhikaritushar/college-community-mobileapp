// import 'package:college_community_main/features/splash/presentation/view_model/splash_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<SplashCubit>().init(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[50],
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 200,
//                   width: 200,
//                   child: Image.asset('assets/images/college.png'),
//                 ),
//                 const Text(
//                   'College Community',
//                   style: TextStyle(
//                     fontSize: 25,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const CircularProgressIndicator(),
//                 const SizedBox(height: 10),
//                 const Text('version : 1.0.0')
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 10,
//             left: MediaQuery.of(context).size.width / 4,
//             child: const Text(
//               'Developed by: College Community',
//               style: TextStyle(fontSize: 15),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:college_community_main/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              width: 180,
              child: Image.asset('assets/images/college.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to College Community',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
            const SizedBox(height: 15),
            const Text(
              'Version: 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              'Developed by: Tushar Adhikari',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}