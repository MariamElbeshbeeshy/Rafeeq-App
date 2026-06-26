import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class SimplifiedContentView extends StatefulWidget {
  const SimplifiedContentView({super.key});
  static String id = "SimplifiedContentView";

  @override
  State<SimplifiedContentView> createState() => _SimplifiedContentViewState();
}

class _SimplifiedContentViewState extends State<SimplifiedContentView> {
  bool isFirstWay = true; // متغير للتحكم في الـ Tabs
  bool isPlaying = false; // متغير لحالة تشغيل الصوت

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),

              // 1. الـ Custom AppBar العلوي
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // زر الرجوع
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  // عنوان الصفحة
                  Text(
                    "المحتوى المبسط",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // زر الـ PDF الأصفر
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFCC00),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "PDF",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.file_download_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      // منطقة عرض النص قابلة للتمرير لو النص طويل
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildStoryText(
                                "في قديم الزمان، في حديقة خضراء كبيرة، عاش نمل صغير.",
                              ),
                              _buildStoryText(
                                "لم يكن مثل باقي النمل كان شجاعًا جدًا، جدًا.",
                              ),
                              _buildStoryText(
                                "كان يحب مساعدة أصدقائه، ولا يخاف",
                              ),
                              // محاكاة للكلمة المظللة بلون أصفر فاقع أثناء القراءة
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF299),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  "من التجربة.",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              _buildStoryText(
                                "وعندما يخطئ، يبتسم ويُحاول من جديد.",
                              ),
                              _buildStoryText("في قديم الزمان، في حديقة خضراء"),
                            ],
                          ),
                        ),
                      ),

                      const Divider(color: Color(0xFFE2E8F0)),

                      // 4. الـ Audio Player المدمج بالأسفل
                      Column(
                        children: [
                          // شريط تقدم الصوت وعرض الأوقات
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 6.h,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 0,
                              ), // إخفاء الدائرة الدوارة لتطابق التصميم
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 0,
                              ),
                            ),
                            child: Slider(
                              value: 0.15, // محاكاة لنسبة الوقت الحالي
                              min: 0,
                              max: 1.30,
                              activeColor: const Color(0xFFFFCC00),
                              inactiveColor: const Color(0xFFE2E8F0),
                              onChanged: (v) {},
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1:30",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "0:15",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          // أزرار التحكم بالصوت
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // إرجاع 5 ثواني
                              IconButton(
                                icon: const Icon(
                                  Icons.replay_5_rounded,
                                  size: 32,
                                  color: Color(0xFF4A5568),
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(width: 24.w),
                              // زر التشغيل / الإيقاف
                              GestureDetector(
                                onTap: () =>
                                    setState(() => isPlaying = !isPlaying),
                                child: Container(
                                  width: 54.r,
                                  height: 54.r,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFCC00),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isPlaying
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    size: 36.r,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 24.w),
                              // تقديم 5 ثواني
                              IconButton(
                                icon: const Icon(
                                  Icons.forward_5_rounded,
                                  size: 32,
                                  color: Color(0xFF4A5568),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),

      // 5. الـ Bottom Navigation Bar المصمم يدوياً ليطابق التصميم الدائري الفاخر للمشروع
      bottomNavigationBar: Container(
        height: 70.h,
        margin: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.r),
          border: Border.all(
            color: const Color(0xFFFFCC00).withOpacity(0.4),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.bookmark_border_rounded,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.workspace_premium_outlined,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.home_outlined, color: Colors.grey),
              onPressed: () {},
            ),
            // العنصر النشط حالياً (الـ OCR أو الملفات المكتوبة) مغلف بـ Container مصمم
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9E6),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: const Icon(
                Icons.article_rounded,
                color: Color(0xFFFFCC00),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.person_outline_rounded,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لبناء أسطر النص بشكل مرتب وثابت
  Widget _buildStoryText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          height: 1.6, // لإعطاء مسافة قراءة مريحة للطفل
        ),
      ),
    );
  }
}
