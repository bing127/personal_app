import 'package:cappuccino/common/remixicon.dart';
import 'package:cappuccino/common/style.dart';
import 'package:cappuccino/pages/article/page/article_page.dart';
import 'package:cappuccino/pages/my/page/my_page.dart';
import 'package:cappuccino/pages/project/page/project_page.dart';
import 'package:cappuccino/pages/recruit/page/recruit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  List<String> _appBarTitles = ['热文', '项目', '招聘', '我的'];
  int _tabIndex = 0;
  final PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          ArticlePage(),
          ProjectPage(),
          RecruitPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _tabIndex,
        elevation: 0.0,
        selectedItemColor: BasicStyle.mainColor,
        unselectedItemColor: Color(0xff666666).withOpacity(.3),
        selectedFontSize: ScreenUtil().setSp(25),
        unselectedFontSize: ScreenUtil().setSp(25),
        iconSize: ScreenUtil().setSp(43),
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildTabIcon(_tabIndex == 0 ? RemixIcon.star_smile_fill : RemixIcon.star_smile_line),
            title: _buildTabText(0),
          ),
          BottomNavigationBarItem(
            icon: _buildTabIcon(_tabIndex == 1 ? RemixIcon.github_fill : RemixIcon.github_line),
            title: _buildTabText(1),
          ),
          BottomNavigationBarItem(
            icon: _buildTabIcon(_tabIndex == 2 ? RemixIcon.pages_fill : RemixIcon.pages_line),
            title: _buildTabText(2),
          ),
          BottomNavigationBarItem(
            icon: _buildTabIcon(_tabIndex == 3 ? RemixIcon.user_6_fill : RemixIcon.user_6_line),
            title: _buildTabText(3),
          ),
        ],
      ),
    );
  }

  Widget _buildTabText(int index) {
    return SizedBox.shrink();
  }

  Widget _buildTabIcon(IconData icon) {
    return Icon(
      icon,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}
