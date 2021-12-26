//import 'package:flutter/material.dart';
//
//class Body extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    //it will provide us total height and width of the screen
//    Size size = MediaQuery.of(context).size;
//    //it enable scrolling on small device
//    return SingleChildScrollView(
//      child: Column(
//        children: <Widget>[
//          HeaderWithSearchBox(size: size),
//          //it will cover 40% of the total width
//          TitleWithMoreBtn(title: "Recommended", press: () {}),
//          RecommendsPlants(),
//          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
//          FeaturedPlants(),
//          SizedBox(height: kDefaultPadding),
//        ],
//      ),
//    );
//  }
//}
