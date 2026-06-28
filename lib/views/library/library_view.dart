import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/widgets/library_card.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> libraryItems = [
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
    {"title": "استيقظ مازن مبكرًا وذهب إلى المد...", "level": "المستوى الأول"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "مكتبتك",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.h),
              SizedBox(
                height: 44.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFilterChip("الكل", 0),
                    _buildFilterChip("المحفوظات", 1),
                    _buildFilterChip("حل مرة أخرى", 2),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              Expanded(
                child: ListView.builder(
                  itemCount: libraryItems.length,
                  padding: EdgeInsets.only(bottom: 16.h),
                  itemBuilder: (context, index) {
                    final item = libraryItems[index];
                    final Color dynamicColor =
                        cardColors[index % cardColors.length];

                    return LibraryCard(dynamicColor: dynamicColor, item: item, index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, int index) {
    bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFCC00) : const Color(0xFFFFFDF0),
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFFCC00)
                : const Color(0xFFFFF2CC),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : const Color(0xFF2D3748),
          ),
        ),
      ),
    );
  }
}


