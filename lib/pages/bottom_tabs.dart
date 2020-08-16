import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/stats.dart';
import '../pages/info.dart';
import '../pages/news.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _currentPageIndex = 0;
  List<Widget> _page = [
    Stats(),
    News(),
    Info(),
  ];

  void _selectTab(tabIndex) {
    setState(() {
      _currentPageIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentPageIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(71, 63, 151, 0.04),
            blurRadius: 24,
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentPageIndex,
            onTap: (tabIndex) => _selectTab(tabIndex),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('img/stats_icon.png'),
                title: Text('Stats'),
                activeIcon: Image.asset('img/stats_icon_active.png'),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('img/news_icon.png'),
                title: Text('News'),
                activeIcon: Image.asset('img/news_icon_active.png'),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('img/info_icon.png'),
                title: Text('Info'),
                activeIcon: Image.asset('img/info_icon_active.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
