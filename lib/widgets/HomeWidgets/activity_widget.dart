import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rafeeq_app/helper/constants.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLocked = false;
    return Container(
      width: 343.w,
      height: 360.h,
      margin: EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          /*** stack to display photo of the level ***/
          Stack(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 191.h,
              ),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  bottomRight: Radius.circular(50),
                ),
                child: Image.asset(
                  width: double.infinity,
                  height: 191.h,
                  'assets/images/levels/lvl1.png',
                  alignment: AlignmentGeometry.topRight,
                  fit: BoxFit.cover,
                ),
              ),
              if (isLocked)
                Container(
                  width: double.infinity,
                  height: 191.h,
                  decoration: BoxDecoration(
                    color: Color(0xffCDCDCD).withValues(
                    alpha: 0.7,
                  ),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                  ),
                 
                ),
            ],
          ),
          /*** stack to display level info***/
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: isLocked? Color(0xffCDCDCD):Color(0xff809F77), //parameter
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusGeometry.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),

                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 23.sp,
                        fontFamily: 'Cairo',
                      ),
                      subtitleTextStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 23.sp,
                        fontFamily: 'Cairo',
                      ),
                      trailing:isLocked?
                      Icon(Icons.lock,color: kPrimaryColor,)
                      :CircularPercentIndicator(
                        radius: 25,
                        lineWidth: 6,
                        percent: 0.76, //parameter
                        center: Text("75%"), //parameter
                        progressColor: Color(0xff809F77),
                      ),
                      title: Row(
                        spacing: 2,
                        children: [
                          Text(' المستوى'),
                          Text(
                            'الثانى',
                            style: TextStyle(color: Color(0xff809F77)),
                          ),
                        ],
                      ),
                      subtitle: Text('لنتعلم مهارات جديدة'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
