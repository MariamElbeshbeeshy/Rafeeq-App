import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rafeeq_app/cubits/child%20cubit/child_cubit.dart';
import 'package:rafeeq_app/cubits/font%20settings%20cubit/font_settings_cubit.dart';
import 'package:rafeeq_app/cubits/library%20cubit/library_cubit.dart';
import 'package:rafeeq_app/models/ChildModel/user_data_model.dart';
import 'package:rafeeq_app/models/GamePlayModels/option_model.dart';
import 'package:rafeeq_app/models/GamePlayModels/question_content_type.dart';
import 'package:rafeeq_app/models/GamePlayModels/questions_model.dart';
import 'package:rafeeq_app/models/Library/library_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';
import 'package:rafeeq_app/views/navigation_view.dart';
import 'package:rafeeq_app/views/login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/views/OCR/ocr_view.dart';
import 'package:rafeeq_app/views/OCR/ocr_camera_view.dart';
import 'package:rafeeq_app/views/otp_view.dart';
import 'package:rafeeq_app/views/profile_view.dart';
import 'package:rafeeq_app/views/qr_scan_view.dart';
import 'package:rafeeq_app/views/test_view.dart';
import 'package:rafeeq_app/views/quistions/mcq_view.dart';
import 'package:rafeeq_app/widgets/app_theme.dart';
import 'package:rafeeq_app/models/HomeModel/home_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataModelAdapter());
  Hive.registerAdapter(HomeModelAdapter());
  Hive.registerAdapter(HomeDataModelAdapter());
  Hive.registerAdapter(HeaderInfoAdapter());
  Hive.registerAdapter(LevelsListAdapter());
  Hive.registerAdapter(StreakInfoAdapter());
  Hive.registerAdapter(QuestionContentTypeAdapter());
  Hive.registerAdapter(OptionModelAdapter());
  Hive.registerAdapter(QuestionModelAdapter());
  Hive.registerAdapter(LibraryItemModelAdapter());

  await Hive.openBox<LibraryItemModel>('library_box');
  await Hive.openBox<UserDataModel>('userBox');
  await Hive.openBox<HomeModel>('home info');
  //UserLocalServices().clearUserData();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FontSettingsCubit>(
          create: (context) => FontSettingsCubit(),
        ),
        BlocProvider<ChildCubit>(
          create: (context) => ChildCubit()..getChildData(),
        ),
        BlocProvider<LibraryCubit>(create: (context) => LibraryCubit()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Token: ${UserLocalServices().getToken()}");
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
                NavigationView.id: (context) => NavigationView(),
                OcrCameraView.id: (context) => OcrCameraView(),
                TestView.id: (context) => TestView(),
                McqView.id: (context) => McqView(),
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
              initialRoute: TestView.id,
              // initialRoute: UserLocalServices().getToken() == null
              //     ? LoginView.id
              //     : NavigationView.id,
            );
          },
        );
      },
    );
  }
}
