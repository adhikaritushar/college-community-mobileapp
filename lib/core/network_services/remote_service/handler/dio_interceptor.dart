// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// void longDebugPrint(String message) {
//   final pattern = RegExp('.{1,800}'); // 800 is a safe size to avoid truncation
//   for (final match in pattern.allMatches(message)) {
//     debugPrint(match.group(0));
//   }
// }

// class DioInterceptor extends Interceptor {
//   static const String _resetColor = '\x1B[0m';
//   static const String _greenColor = '\x1B[96m';
//   static const String _yellowColor = '\x1B[33m';
//   static const String _redColor = '\x1B[31m';

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     debugPrint(
//       "$_redColor[API Error] <<-- URL: ${err.requestOptions.baseUrl}${err.requestOptions.path}\n"
//       "Error: ${err.message}\n"
//       "Type: ${err.type}$_resetColor",
//     );
//     super.onError(err, handler);
//   }
// }
