import 'package:flutter/material.dart';
import 'package:my_classcar/layouts/main_page/app_bar.dart';

import '../../../../models/car.dart';

class DetailCarPage extends StatefulWidget {
  const DetailCarPage({Key? key, required this.car}) : super(key: key);

  final Car car;

  @override
  State<StatefulWidget> createState() => _DetailCarPage();
}

class _DetailCarPage extends State<DetailCarPage> {
  late Car car = widget.car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: closeAppBar("${car.carModel}", context),
      body: ListView(
        controller: null,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://taegon.kim/wp-content/uploads/2018/05/image-5.png",
                width: 500,
                fit: BoxFit.fitHeight,
              ),
              _info()
            ],
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Color(0xffc9c9c9),
      ))),
      padding: const EdgeInsets.all(12.0),
      height: 80,
      //margin: const EdgeInsets.symmetric(vertical: 24,horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(textAlign: TextAlign.left, "${car.sharingPrice}원/일"),
                const Text(textAlign: TextAlign.left, "합계요금"),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width/360*200),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(12.0),
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xff1200b3),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {},
              child: const Text("대여하기"),
            )
          ],
        ),
      );
  }

  Widget _info() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${car.carModel}",
            textAlign: TextAlign.start,
          ),
          Text(
            "${car.score} (${car.sharedCount}회 대여)",
          ),
          const SizedBox(height: 16.0),
          const Text("대여 날짜"),
          const Text("날짜 설정"),
          const SizedBox(height: 16.0),
          const Text("대여&반납 위치"),
          Text("${car.carLocation}"),
          const SizedBox(height: 16.0),
          const Text("환불 정책"),
          const Text("환불 정책 내용"),
          const SizedBox(
            height: 16.0,
          ),
          const Text("차량 추가 정보"),
          Text("좌석 : ${car.seats}인석"),
          Text("기름 종류 : ${car.oilType}"),
          Text("연식 : ${car.years}"),
        ],
      ),
    );
  }
}
