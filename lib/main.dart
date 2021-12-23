import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/home_tab.dart';
import 'package:vietnam_travel_app/map_areas.dart';
import 'package:vietnam_travel_app/splash_page1.dart';
import 'package:vietnam_travel_app/tim_kiem.dart';
import 'package:vietnam_travel_app/seemore_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const SplashPage(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: [
        const Text(
          'Home Page đang bị lỗi',
          style: TextStyle(color: Colors.black),
        ),
        search_tab(),
        map_areas(),
        const SeeMorePage(),
      ]),
      bottomNavigationBar: Container(
        width: 50,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0XFF0869E1), width: 2)),
        ),
        child: TabBar(
          labelColor: const Color(0XFF0869E1),
          controller: _tabController,
          unselectedLabelColor: const Color(0XFF050505),
          isScrollable: true,
          tabs: const [
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: Color(0XFF0869E1),
                size: 18,
              ),
              text: "Trang chủ",
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.search,
                color: Color(0XFF0869E1),
                size: 18,
              ),
              text: "Tìm kiếm",
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.mapMarkedAlt,
                color: Color(0XFF0869E1),
                size: 18,
              ),
              text: "Bản đồ",
            ),
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: Color(0XFF0869E1),
                size: 18,
              ),
              text: "Xem thêm",
            ),
          ],
        ),
      ),
    );
  }
}
