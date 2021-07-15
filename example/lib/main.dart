import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart' as SC;
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart' as WD;

import 'slider_page.dart';

class QuickStartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavLayout(
      // The app's destinations
      pages: [
            (_) => Center(child: Text("Welcome to bottom_nav_layout")),
            (_) => SliderPage(),
            (_) => Center(child: TextField(decoration: InputDecoration(hintText: 'Go..'))),
      ],

      // Enables or disables the page state preservation. Default is false.
      savePageState: false,

      // Enables or disables the lazy loading of pages. Default is false.
      lazyLoadPages: false,

      // Default is `ReorderToFrontPageStack(initialPage: 0)`
      pageStack: ReorderToFrontPageStack(initialPage: 0),
      // pageStack: StandardPageStack(initialPage: 0),
      // pageStack: ReorderToFrontExceptFirstPageStack(initialPage: 0),
      // pageStack: NoPageStack(initialPage: 0),
      // pageStack: FirstAndLastPageStack(initialPage: 0),

      // Widget that styles the bottom bar. Default is null.
      bottomBarWrapper: (bottomBar) => Padding(
        padding: EdgeInsets.zero,
        child: bottomBar,
      ),

      // Similar to [Scaffold.extendBody]. Default is false.
      extendBody: false,

      // Similar to [Scaffold.resizeToAvoidBottomInset]. Default is true.
      resizeToAvoidBottomInset: true,

      //pageStack: NoPageStack(initialPage: 0),
      bottomNavigationBar: (currentIndex, onTap) => _buildSnakeNavigationBar(currentIndex, onTap),
    );
  }

  /// You can pass onTap directly or you can insert your code as following:
  /// onTap: (index) => {
  ///   // Your code
  ///   onTap(index);
  /// },
  Widget _buildBottomNavigationBar(int currentIndex, Function(int) onTap) => BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: onTap,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.linear_scale), label: 'Slider'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    ],
  );

  Widget _buildConvexAppBar(int currentIndex, Function(int) onTap) => ConvexAppBar(
    initialActiveIndex: currentIndex,
    onTap: onTap,
    items: [
      TabItem(icon: Icon(Icons.home), title: 'Home'),
      TabItem(icon: Icon(Icons.linear_scale), title: 'Slider'),
      TabItem(icon: Icon(Icons.search), title: 'Search'),
    ],
  );

  Widget _buildSnakeNavigationBar(int currentIndex, Function(int) onTap) => SnakeNavigationBar.color(
    currentIndex: currentIndex,
    onTap: onTap,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.linear_scale), label: 'Slider'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    ],
  );

  Widget _buildSalomonBottomBar(int currentIndex, Function(int) onTap) => SalomonBottomBar(
    currentIndex: currentIndex,
    onTap: onTap,
    items: [
      SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
      SalomonBottomBarItem(icon: Icon(Icons.linear_scale), title: Text('Slider')),
      SalomonBottomBarItem(icon: Icon(Icons.search), title: Text('Search')),
    ],
  );

  Widget _buildBottomBarWithSheet(int currentIndex, Function(int) onTap) => BottomBarWithSheet(
    selectedIndex: currentIndex,
    onSelectItem: onTap,
    items: [
      BottomBarWithSheetItem(icon: Icons.home, label: 'Home'),
      BottomBarWithSheetItem(icon: Icons.linear_scale, label: 'Slider'),
      BottomBarWithSheetItem(icon: Icons.search, label: 'Search'),
    ],
    sheetChild: Center(child: Text("Welcome to sheetChild")),
  );

  Widget _buildWaterDropNavBar(int currentIndex, Function(int) onTap) => WD.WaterDropNavBar(
    selectedIndex: currentIndex,
    onButtonPressed: onTap,
    barItems: [
      WD.BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home),
      WD.BarItem(filledIcon: Icons.maximize, outlinedIcon: Icons.maximize),
      WD.BarItem(filledIcon: Icons.search, outlinedIcon: Icons.search),
    ],
  );

  Widget _buildSlidingClippedNavBar(int currentIndex, Function(int) onTap) => SC.SlidingClippedNavBar(
    selectedIndex: currentIndex,
    onButtonPressed: onTap,
    barItems: [
      SC.BarItem(icon: Icons.home, title: 'Home'),
      SC.BarItem(icon: Icons.linear_scale, title: 'Slider'),
      SC.BarItem(icon: Icons.search, title: 'Search'),
    ],
    activeColor: Colors.blue,
  );
}
