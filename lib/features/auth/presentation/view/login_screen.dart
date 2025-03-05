import 'dart:math';

import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

class LoginScreen extends StatefulWidget {
  final String lable;
  const LoginScreen({
    super.key,
    required this.lable,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Threshold for shake detection
  final double shakeThreshold = 25.0;
  bool isShaking = false;

  clearControler() {
    _loginIDController.clear();
    _passwordController.clear();
  }

  @override
  void initState() {
    super.initState();
    clearControler();

    // Listen for accelerometer events to detect shake gestures
    accelerometerEvents.listen((event) {
      _detectShake(event);
    });
  }

  void _detectShake(AccelerometerEvent event) {
    double acceleration = sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

    // If acceleration exceeds the threshold, consider it a shake
    if (acceleration > shakeThreshold && !isShaking) {
      setState(() {
        isShaking = true;
      });
      _triggerLogin();
    }
  }

  // Trigger the login process when a shake is detected
  void _triggerLogin() {
    if (_formkey.currentState!.validate()) {
      context.read<AuthCubit>().loginDashBoard(
            context: context,
            loginID: _loginIDController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }

    // After the login, reset the shaking state
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isShaking = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _loginIDController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.lable} Login",
              style: AppTextStyle.textStyle(context: context, fontSize: 25),
            ),
            const SizedBox(height: 50),
            KTextFormField(
              keyboardType: TextInputType.number,
              controller: _loginIDController,
              label: "${widget.lable} Login ID",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Login ID is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            KTextFormField(
              controller: _passwordController,
              label: "Password",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 50),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Center(
                  child: KElevatedButton(
                    label: "Login",
                    isLoading: state.isLoadingState,
                    onPressed: () {
                      if (mounted) {
                        if (_formkey.currentState!.validate()) {
                          context.read<AuthCubit>().loginDashBoard(
                                context: context,
                                loginID: _loginIDController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                        }
                      }
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
