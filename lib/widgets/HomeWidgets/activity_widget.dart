import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/models/HomeModel/level_list_model.dart';
import 'package:rafeeq_app/views/game_play/game_play_view.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key, required this.level});

  final LevelsList level;

  @override
  Widget build(BuildContext context) {
    final isLocked = level.status == 1;
    final percent = (level.completionPercentage / 100).clamp(0.0, 1.0);
    final List<String> levelsImages = [
      'assets/images/levels/lvl1.png',
      'assets/images/levels/lvl2.png',
      'assets/images/levels/lvl3.png',
      'assets/images/levels/lvl4.png',
      'assets/images/levels/lvl4.png',
    ];
    final List<Color> levelsColor = [
      Color(0xff809F77),
      Color(0xffFFE36B),
      Color(0xffE85335),
      Color(0xffF0B60C),
      Color(0xffF0B60C),
    ];

    final int i = level.id;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GamePlayView(levelId: level.id),
          ),
        );
      },
      child: Container(
        width: 343.w,
        height: 360.h,
        margin: EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 191.h,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  child: Image.asset(
                    width: double.infinity,
                    height: 191.h,
                    levelsImages[i - 1],
                    alignment: Alignment.topRight,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isLocked)
                  Container(
                    width: double.infinity,
                    height: 191.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffCDCDCD).withValues(alpha: 0.7),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: isLocked
                        ? const Color(0xffCDCDCD)
                        : levelsColor[i - 1],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    constraints: BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 23.sp,
                        fontFamily: 'Cairo',
                      ),
                      subtitleTextStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        fontFamily: 'Cairo',
                      ),
                      trailing: isLocked
                          ? Icon(Icons.lock, color: kPrimaryColor)
                          : CircularPercentIndicator(
                              radius: 25,
                              lineWidth: 6,
                              percent: percent,
                              center: Text('${level.completionPercentage}%'),
                              progressColor: levelsColor[i - 1],
                            ),
                      title: Row(
                        children: [
                          SizedBox(width: 4.w),
                          Text(
                            level.title,
                            style: TextStyle(color: levelsColor[i - 1]),
                          ),
                        ],
                      ),
                      subtitle: Text(level.description),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
