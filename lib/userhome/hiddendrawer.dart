import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:prj1/Login.dart';
import 'package:prj1/userhome/bottomnav.dart';
import 'package:prj1/userhome/drawrsettings.dart';
import 'package:prj1/userhome/logout.dart';

class HiddenDrawr extends StatefulWidget {
  const HiddenDrawr({Key? key});

  @override
  State<HiddenDrawr> createState() => _HiddenDrawrState();
}

class _HiddenDrawrState extends State<HiddenDrawr> {
  late List<ScreenHiddenDrawer> _pages;

  @override
  void initState() {
    super.initState();
    _initializePages();
  }

  void _initializePages() {
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(  
          name: 'home',
          baseStyle: GoogleFonts.poppins(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
          selectedStyle: const TextStyle(color: Colors.black),
        ),
        const BottomNav(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "ABOUT",
          baseStyle: GoogleFonts.poppins(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
          ),
          selectedStyle: const TextStyle(color: Colors.black),
        ),
        const Settings(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "SETTINGS ",
          baseStyle: GoogleFonts.poppins(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
          ),
          selectedStyle: const TextStyle(color: Colors.black),
        ),
        LogoutButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => false,
            );
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
    
      elevationAppBar: 0,
      backgroundColorAppBar: const Color.fromARGB(51, 138, 230, 230).withOpacity(0.8),

      
      backgroundColorMenu: const Color.fromARGB(255, 11, 97, 141),
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 40,
      curveAnimation: Curves.ease,
      contentCornerRadius: 20,
      withShadow: false,
      leadingAppBar: const Icon(Icons.menu_open, color: Color.fromARGB(255, 0, 0, 0)),
      isDraggable: true,
      disableAppBarDefault: false ,
    
    );
  }
}
