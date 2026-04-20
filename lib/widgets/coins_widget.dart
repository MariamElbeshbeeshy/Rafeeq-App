import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsWidget extends StatelessWidget {
  const CoinsWidget({
    super.key, required this.coins,
  });

  final int coins;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Image.asset(
          "assets/images/coin.png" ,
     
          ),
        SizedBox(width: 8.w,) ,
        Text(
         "$coins",
         style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700
         ),
        ),
         
    
       
    
      ],
    );
  }
}