import 'package:e_shop/Models/item.dart';
import 'package:e_shop/Pages/Appbar_for_search.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Widgets/colors.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Widgets/customAppBar.dart';

class SearchProduct extends StatefulWidget {
  @override
  _SearchProductState createState() => new _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  Future<QuerySnapshot> docList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForsearch(
        bottom: PreferredSize(
            child: searchWidget(), preferredSize: Size(56.0, 56.0)),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder<QuerySnapshot>(
        future: docList,
        builder: (context, snap) {
          return snap.hasData
              ? ListView.builder(
                  itemCount: snap.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snap.data.documents[index].data);

                    return sourceInfo(model, context);
                  },
                )
              : Center(
                  child: Text(
                  "No data available.",
                ));
        },
      ),
    );
  }

  Widget searchWidget() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 50,
            color: kPrimaryColor.withOpacity(0.23),
          ),
        ],
        gradient: new LinearGradient(
          colors: [kPrimaryColor, kPrimaryColor],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.search,
                color: kPrimaryColor.withOpacity(0.5),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: TextField(
                  onChanged: (value) {
                    startSearching(value);
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: "Search here...",
                    hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future startSearching(String query) async {
    docList = Firestore.instance
        .collection("items")
        .where("shortInfo", isGreaterThanOrEqualTo: query)
        .getDocuments();
  }
}
