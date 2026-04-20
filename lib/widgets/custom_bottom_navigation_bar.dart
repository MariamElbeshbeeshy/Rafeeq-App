import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> navIcons = [
      'assets/images/nav_home.png',
      'assets/images/nav_scan.png',
      'assets/images/nav_home.png',
      'assets/images/nav_profile.png',
      'assets/images/nav_menu.png',
    ];

    final List<String> navLabels = [
      'الرئيسية',
      'المسح',
      'البحث',
      'الملف الشخصي',
      'المزيد',
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          navIcons.length,
          (index) {
            final isSelected = currentIndex == index;
            return GestureDetector(
              onTap: () => onItemTapped(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 20.w : 8.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(40.r),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: const Color(0xFFEECCA6).withOpacity(0.6),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Image.asset(
                  navIcons[index],
                  width: 24.w,
                  height: 24.h,
                  color: isSelected ? Colors.white : Color(0xffB3B3B3),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
