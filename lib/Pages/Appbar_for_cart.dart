import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarForCart extends StatelessWidget with PreferredSizeWidget {
  final PreferredSizeWidget bottom;

  AppBarForCart({this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => StoreHome(),
            ),
                (route) => false,//if you want to disable back feature set to false
          );
        },
        child: Icon(
          Icons.arrow_back,
          color: kBackgroundColor,
        ),
      ),
      flexibleSpace: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [kPrimaryColor, kPrimaryColor],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        "E_shop",
        style: TextStyle(
            fontSize: 25.0,
            color: kBackgroundColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
}
