import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/widgets/user_info.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static String id = 'Profile View';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  double _fontSizeValue = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 99.h),
              UserInfo(),
              SizedBox(height: 32.h),
              Align(
                alignment:
                    Alignment.centerRight, // Align to the right for Arabic
                child: Text(
                  "إعدادات الحساب",
                  //textAlign: ,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff364153),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffE6E6E6), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(156, 178, 178, 176),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // For Arabic alignment
                  children: [
                    const Text(
                      'حجم الخط',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff101828),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${_fontSizeValue.toInt()}%',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1A1C1E),
                        ),
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 7,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 10,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 20,
                        ),
                        activeTrackColor:
                            kPrimaryColor, // The yellow from your image
                        inactiveTrackColor: Color(0xffE0E0E0),
                        thumbColor: Colors.white, // White thumb like the image
                      ),
                      child: Slider(
                        value: _fontSizeValue,
                        min: 50,
                        max: 200,
                        onChanged: (value) {
                          setState(() {
                            _fontSizeValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffE6E6E6), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(156, 178, 178, 176),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'نوع الخط',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff101828),
                      ),
                    ),
                    DropdownMenu(
                      width: 206.w,

                      trailingIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xff101828),
                      ),
                      selectedTrailingIcon: Icon(
                        Icons.keyboard_arrow_up,
                        color: Color(0xff101828),
                      ),

                      initialSelection: 'Cairo',
                      dropdownMenuEntries: kFontOptions,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Align(
                alignment:
                    Alignment.centerRight, // Align to the right for Arabic
                child: Text(
                  "الإنجازات",
                  //textAlign: ,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff364153),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 110.w,
                      height: 87.h,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffE6E6E6), width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(156, 178, 178, 176),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xffFEC108),
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'إنجاز 1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1A1C1E),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  // Handle logout action
                },

                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xffE6E6E6), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(156, 178, 178, 176),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout, color: kPrimaryColor),
                      SizedBox(width: 10.w),
                      const Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff101828),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
