import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rafeeq_app/cubits/font%20settings%20cubit/font_settings_cubit.dart';
import 'package:rafeeq_app/models/user_data_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';
import 'package:rafeeq_app/views/navigation_view.dart';
import 'package:rafeeq_app/views/login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/views/OCR/ocr_view.dart';
import 'package:rafeeq_app/views/otp_view.dart';
import 'package:rafeeq_app/views/profile_view.dart';
import 'package:rafeeq_app/views/qr_scan_view.dart';
import 'package:rafeeq_app/widgets/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataModelAdapter());
  await Hive.openBox<UserDataModel>('userBox');
  runApp(
    BlocProvider(
      create: (context) => FontSettingsCubit(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    UserLocalServices userLocalServices = UserLocalServices();
    return BlocBuilder<FontSettingsCubit, FontSettingsState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              locale: const Locale('ar'),
              supportedLocales: const [Locale('ar')],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: AppTheme(fontFamily: state.fontSettings.fontFamily),
              debugShowCheckedModeBanner: false,
              routes: {
                LoginView.id: (context) => LoginView(),
                QRScanView.id: (context) => QRScanView(),
                OtpView.id: (context) => OtpView(),
                ProfileView.id: (context) => ProfileView(),
                OcrView.id: (context) => OcrView(),
               NavigationView.id: (context) =>  NavigationView(),
              },
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.linear(
                      state.fontSettings.fontSize / 100,
                    ),
                  ),
                  child: child!,
                );
              },
              //initialRoute: ProfileView.id,
              initialRoute: userLocalServices.getUserData() == null
                  ? LoginView.id
                  : NavigationView.id,
            );
          },
        );
      },
    );
  }
}
