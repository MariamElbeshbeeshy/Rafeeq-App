import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/child%20cubit/child_cubit.dart';
import 'package:rafeeq_app/widgets/achievement_list.dart';
import 'package:rafeeq_app/widgets/font_options.dart';
import 'package:rafeeq_app/widgets/heading_text.dart';
import 'package:rafeeq_app/widgets/logout_button.dart';
import 'package:rafeeq_app/widgets/user_info.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static String id = 'Profile View';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => ChildCubit()..getChildData(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  [
                        SizedBox(height: 80.h),
                        UserInfo(),
                        SizedBox(height: 16.h),
                        HeadingText(text: "إعدادات الحساب"),
                        FontOptions(),
                        SizedBox(height: 16.h),
                        HeadingText(text: "الإنجازات"),
                        AchievementList(),
                        LogoutButton(),
                      ]
                      .expand((widget) => [widget, SizedBox(height: 16.h)])
                      .toList()
                    ..removeLast(),
            ),
          ),
        ),
      ),
    );
  }
}
