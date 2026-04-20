import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelWidget extends StatelessWidget {
  const LevelWidget({super.key, required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          levelName(level),
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),

        SizedBox(width: 8.w),

        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset("assets/images/Polygon.png"),
            Text(
              "$level",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffC97A07),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String levelName(int level) {
  switch (level) {
    case 1:
      return "المستوى الأول";

    case 2:
      return "المستوى الثانى";

    case 3:
      return "المستوى الثالث";

    case 4:
      return "المستوى الرابع";

    case 5:
      return "المستوى الخامس";

    case 6:
      return "المستوى السادس";

    default:
      return "المستوى الأول";
  }
}
