import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafeeq_app/cubits/child%20cubit/child_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/views/Home/home_page.dart';
import 'package:rafeeq_app/views/Home/home_view.dart';
import 'package:rafeeq_app/services/user_local_services.dart';
import 'package:rafeeq_app/views/OCR/ocr_view.dart';
import 'package:rafeeq_app/views/game_play/home_view_helper.dart';
import 'package:rafeeq_app/views/profile_view.dart';
import 'package:rafeeq_app/widgets/app_theme.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});
  static String id = "navigation view";

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedIndex = 2;
  
  final List<Widget> _pages=[
    Center(child: Text("welcome in library"),) ,
    Center(child: Text("welcome in achievments"),) ,
    HomePage() ,
    OcrView() ,
    ProfileView() ,

  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      //////////////////////////////////////
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: BoxBorder.all(color: kPrimaryColor),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(254, 193, 8, 0.12), blurRadius: 5),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onNavItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? navigationIconTheme(
                        image: "assets/images/Book.png",
                        selected: true,
                      )
                    : navigationIconTheme(
                        image: "assets/images/Book.png",
                        selected: false,
                      ),
                label: "المكتبة",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? navigationIconTheme(
                        image: "assets/images/medal.png",
                        selected: true,
                      )
                    : navigationIconTheme(
                        image: "assets/images/medal.png",
                        selected: false,
                      ),
                label: "الإنجازات",
              ),

              BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? navigationIconTheme(
                        image: "assets/images/home.png",
                        selected: true,
                      )
                    : navigationIconTheme(
                        image: "assets/images/home.png",
                        selected: false,
                      ),
                label: "الرئيسية",
              ),

              BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? navigationIconTheme(
                        image: "assets/images/scan.png",
                        selected: true,
                      )
                    : navigationIconTheme(
                        image: "assets/images/scan.png",
                        selected: false,
                      ),
                label: "تحميل ملفات",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 4
                    ? navigationIconTheme(
                        image: "assets/images/profile.png",
                        selected: true,
                      )
                    : navigationIconTheme(
                        image: "assets/images/profile.png",
                        selected: false,
                      ),
                label: "الملف الشخصى",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
