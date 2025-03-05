import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(0);

  void nextPage(int totalPages) {
    if (state < totalPages - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
      emit(state + 1);
    } else {
      completeOnboarding();
    }
  }

  void onPageChanged(int index) {
    emit(index);
  }

  void completeOnboarding() {}
}
