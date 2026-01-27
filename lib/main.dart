import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rafeeq_app/views/login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/views/otp_view.dart';
import 'package:rafeeq_app/widgets/app_theme.dart';

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
          locale: const Locale('ar'), // 1. تعيين اللغة للعربية
          supportedLocales: const [Locale('ar')], // 2. اللغات المدعومة
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: AppTheme(),
          debugShowCheckedModeBanner: false,
          // routes: {LoginView.id: (context) => LoginView()},
          // initialRoute: LoginView.id,
          home:OtpView()
        );
      },
    );
  }
}
