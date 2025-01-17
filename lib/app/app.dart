import 'package:college_community_main/core/theme/theme.dart';
import 'package:college_community_main/features/splash/presentation/view/splashscreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dashboard',
      debugShowCheckedModeBanner: false,
      theme:getApplicationTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashscreenView(),
      },
    );
  }
}
