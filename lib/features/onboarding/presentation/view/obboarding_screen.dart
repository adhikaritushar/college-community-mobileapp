import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:college_community/core/constant/app_images.dart';
import 'package:college_community/features/auth/presentation/view/login_dashboard_screen.dart';
import 'package:college_community/features/onboarding/presentation/view_model/cubit/on_boarding_cubit.dart';

import '../../data/datasource/local_datasource/onboarding_local_datasource.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final List<Map<String, String>> _onboardingData = [
    {
      "image": AppImages.onBoard1,
      "title": 'Welcome to College Community',
      "desc": 'Connect, communicate, and collaborate.',
    },
    {
      "image": AppImages.onBoard2,
      "title": 'Simplify Queries',
      "desc": 'Post and answer queries with ease.',
    },
    {
      "image": AppImages.onBoard3,
      "title": 'Stay Updated',
      "desc": 'Get real-time updates from your college.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<OnboardingCubit, int>(
              builder: (context, currentPage) {
                final cubit = context.read<OnboardingCubit>();
                return PageView.builder(
                  controller: cubit.pageController,
                  onPageChanged: cubit.onPageChanged,
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      bgColor: _getBackgroundColor(index),
                      image: _onboardingData[index]["image"]!,
                      title: _onboardingData[index]["title"]!,
                      desc: _onboardingData[index]["desc"]!,
                    );
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: BlocBuilder<OnboardingCubit, int>(
                  builder: (context, currentPage) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _onboardingData.length,
                            (index) => _buildDot(index, currentPage),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: currentPage < _onboardingData.length - 1
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginDashBoard()));
                                      },
                                      child: const Text(
                                        "Skip",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () => context.read<OnboardingCubit>().nextPage(_onboardingData.length),
                                      child: const Text(
                                        "Next",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      OnBoardingService.setOnboarding(isShowOnBoarding: false);
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LoginDashBoard(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: const Text(
                                      "Get Started",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index, int currentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: currentPage == index ? 12 : 8,
      height: currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  Color _getBackgroundColor(int index) {
    switch (index) {
      case 0:
        return Colors.lightBlueAccent;
      case 1:
        return Colors.greenAccent;
      case 2:
        return Colors.purpleAccent;
      default:
        return Colors.blueAccent;
    }
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final Color bgColor;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
