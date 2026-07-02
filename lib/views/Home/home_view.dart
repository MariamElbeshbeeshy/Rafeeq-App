import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/models/HomeModel/home_model.dart';
import 'package:rafeeq_app/services/home_remote_service.dart';
import 'package:rafeeq_app/widgets/HomeWidgets/streak_list.dart';
import 'package:rafeeq_app/widgets/background_widget.dart';
import 'package:rafeeq_app/widgets/level_widget.dart';
import 'package:rafeeq_app/widgets/user_info.dart';

import '../../models/user_data_model.dart';
import '../../services/user_local_services.dart';
import '../../widgets/HomeWidgets/activity_widget.dart';
import '../../widgets/coins_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 
   UserDataModel? userInfo = UserLocalServices().getUserData();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 50),
                child: CoinsWidget(coins: userInfo?.points ?? 0),
              ),
            ],
            title: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: LevelWidget(level: userInfo?.level ?? 1),
            ),
          ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreakList(),
            SizedBox(height: 32.h,),
            Text(
              'الأنشطة',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w700
              ),
              ),
            SizedBox(height: 16.h,),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context , i){
                  return  ActivityWidget();
                }
                ),
            )
        
          ],
        
        ),
      )
    );
  }
}
