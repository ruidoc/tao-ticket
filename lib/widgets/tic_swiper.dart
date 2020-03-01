import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tao_ticket/model/nav_home/recommend.dart';

class TicSwipper extends StatefulWidget {
  TicSwipper({
    Key key,
    this.itemLists,
    this.margin,
    this.decoration
  });

  final List<SwiperData> itemLists;
  final EdgeInsets margin;
  final BoxDecoration decoration;
  @override
  _TicSwipperState createState() => _TicSwipperState();
}

class _TicSwipperState extends State<TicSwipper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(
        top: 12, bottom: 20
      ),
      child: Swiper(
        itemCount: widget.itemLists.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: widget.margin,
            decoration: widget.decoration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                widget.itemLists[index].url,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}
