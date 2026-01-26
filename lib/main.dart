import 'package:flutter/material.dart';
import 'package:rafeeq_app/views/login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(fontFamily: 'Cairo'),
          debugShowCheckedModeBanner: false,
          routes: {LoginView.id: (context) => LoginView()},
          initialRoute: LoginView.id,
        );
      },
    );
  }
}
