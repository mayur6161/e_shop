import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Address/addAddress.dart';
import 'package:e_shop/Store/Search.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Orders/myOrders.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'colors.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),

        ),
      ),
      width: width / 1.4,
      child: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Container(
                padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [kPrimaryColor, kPrimaryColor],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      elevation: 8.0,
                      child: Container(
                        height: 160.0,
                        width: 160.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            EcommerceApp.sharedPreferences
                                .getString(EcommerceApp.userAvatarUrl),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      EcommerceApp.sharedPreferences
                          .getString(EcommerceApp.userName),
                      style: TextStyle(
                          color: kBackgroundColor,
                          fontSize: 35.0,
                          fontFamily: "Signatra"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Container(
                padding: EdgeInsets.only(top: 1.0),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [kPrimaryColor, kPrimaryColor],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: kBackgroundColor,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(color: kBackgroundColor),
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => StoreHome(),
                          ),
                              (route) => false,//if you want to disable back feature set to false
                        );
                      },
                    ),
                    Divider(
                      height: 10.0,
                      color: kBackgroundColor,
                      thickness: 6.0,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.reorder,
                        color: kBackgroundColor,
                      ),
                      title: Text(
                        "My Orders",
                        style: TextStyle(color: kBackgroundColor),
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => MyOrders(),
                          ),
                              (route) => true,//if you want to disable back feature set to false
                        );
                      },
                    ),
                    Divider(
                      height: 10.0,
                      color: kBackgroundColor,
                      thickness: 6.0,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.shopping_cart,
                        color: kBackgroundColor,
                      ),
                      title: Text(
                        "My Cart",
                        style: TextStyle(color: kBackgroundColor),
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => CartPage(),
                          ),
                              (route) => true,//if you want to disable back feature set to false
                        );
                      },
                    ),
                    Divider(
                      height: 10.0,
                      color: kBackgroundColor,
                      thickness: 6.0,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.search,
                        color: kBackgroundColor,
                      ),
                      title: Text(
                        "Search",
                        style: TextStyle(color: kBackgroundColor),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 500),
                                child: SearchProduct()));
                      },
                    ),
                    Divider(
                      height: 10.0,
                      color: kBackgroundColor,
                      thickness: 6.0,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.add_location,
                        color: kBackgroundColor,
                      ),
                      title: Text(
                        "Add New Address",
                        style: TextStyle(color: kBackgroundColor),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 500),
                                child: AddAddress()));
                      },
                    ),
                    Divider(
                      height: 10.0,
                      color: kBackgroundColor,
                      thickness: 6.0,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: kBackgroundColor,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(color: kBackgroundColor),
                      ),
                      onTap: () {
                        EcommerceApp.auth.signOut().then((c) {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 500),
                                  child: AuthenticScreen()));
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
