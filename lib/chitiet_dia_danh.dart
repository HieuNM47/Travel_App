import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/diadanh_object.dart';
import 'package:vietnam_travel_app/chitiet_luu_tru.dart';
import 'package:vietnam_travel_app/chitiet_quan_an.dart';
import 'package:vietnam_travel_app/luu_tru.dart';
import 'package:vietnam_travel_app/quan_an.dart';
import 'package:vietnam_travel_app/create_post.dart';

// ignore: must_be_immutable
class PlaceDetail extends StatefulWidget {
  DiaDanhObject dd;
  PlaceDetail(this.dd, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return PlaceDetailState(dd);
  }
}

class PlaceDetailState extends State<PlaceDetail> {
  DiaDanhObject dd;
  PlaceDetailState(this.dd);
  final List<Column> imgListQuanAn = [];
  final List<Column> imgListLuuTru = [];
  final List<SizedBox> imgDiaDanh = [];
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';
  CarouselSlider slideShow(List<Column> lst) {
    return CarouselSlider(
      items: lst,
      options: CarouselOptions(
          viewportFraction: 0.7,
          height: 217.0,
          autoPlay: false,
          enableInfiniteScroll: true),
    );
  }

  CarouselSlider slideImg(List<SizedBox> lst) {
    return CarouselSlider(
      items: lst,
      options: CarouselOptions(
        viewportFraction: 1,
        height: 230.0,
        autoPlay: true,
        enableInfiniteScroll: true,
      ),
    );
  }

  void loadImgDiaDanh() {
    int b = 5;
    for (int i = 0; i < b; i++) {
      SizedBox a = SizedBox(
        width: double.infinity,
        height: 232,
        child: Image.network(
          urlImg + dd.hinhanh.hinhAnh,
          width: double.infinity,
          height: 232,
          fit: BoxFit.cover,
        ),
      );
      imgDiaDanh.add(a);
    }
  }

  void loadListQuanAn() {
    int b = 5;
    for (int i = 0; i < b; i++) {
      Column a = Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RestaurantDetail()));
            },
            child: SizedBox(
              height: 215,
              child: Card(
                elevation: 7.0,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(16.0),
                    topEnd: Radius.circular(16.0),
                    bottomStart: Radius.circular(16.0),
                    bottomEnd: Radius.circular(16.0),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/quanan.jpg",
                      width: 271,
                      height: 132,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Nhà hàng Baratie",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF242A37),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  color: Color(0XFFFF3535),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " Hồ Chí Minh",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF242A37),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const FaIcon(
                                  FontAwesomeIcons.clock,
                                  color: Color(0XFF0869E1),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " 12 a.m - 10 p.m",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF242A37),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
      imgListQuanAn.add(a);
    }
  }

  void loadListLuuTru() {
    int b = 5;
    for (int i = 0; i < b; i++) {
      Column a = Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChiTietLuuTru()));
            },
            child: SizedBox(
              height: 215,
              child: Card(
                elevation: 7.0,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(16.0),
                    topEnd: Radius.circular(16.0),
                    bottomStart: Radius.circular(16.0),
                    bottomEnd: Radius.circular(16.0),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/luutru.jpg",
                      width: 271,
                      height: 132,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Khách sạn sunny",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF242A37),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  color: Color(0XFFFF3535),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " Hồ Chí Minh",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF242A37),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const FaIcon(
                                  FontAwesomeIcons.clock,
                                  color: Color(0XFF0869E1),
                                  size: 18,
                                ),
                              ),
                              const Text(
                                " 12 a.m - 10 p.m",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Color(0XFF242A37),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
      imgListLuuTru.add(a);
    }
  }

  Row sliderTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0XFF242A37),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () {
              if (title == "Quán ăn gần đây") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => QuanAn()));
              }
              if (title == "Lưu trú gần đây") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LuuTru()));
              }
            },
            child: const Text(
              "Xem thêm",
              style: TextStyle(
                fontSize: 12,
                color: Color(0XFF0066FF),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    loadImgDiaDanh();
    loadListQuanAn();
    loadListLuuTru();
  }

  final scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0X1A050505),
        elevation: 0,
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreatePost(),
                    ),
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.shareAlt,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              slideImg(imgDiaDanh),
            ]),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 130, 10),
              child: Text(
                dd.tenDiaDanh,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    height: 1.6,
                    fontSize: 22,
                    color: Color(0XFF0066FF),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    child: const FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      size: 18,
                      color: Color(0XFFFF3535),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      dd.tinhthanh.tenTinhThanh,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF242A37),
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: const Text(
                "Mô tả",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF242A37),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Flexible(
                child: Text(
                  dd.moTa,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: const Text(
                "Vị trí",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF242A37),
                ),
              ),
            ),
            Image.asset("images/map-hotel.jpg"),
            const SizedBox(
              height: 15,
            ),
            sliderTitle("Quán ăn gần đây"),
            slideShow(imgListQuanAn),
            const SizedBox(
              height: 20,
            ),
            sliderTitle("Lưu trú gần đây"),
            slideShow(imgListLuuTru),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
