import 'package:diis/garment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_details.dart';

class MySwaps extends StatefulWidget {
  const MySwaps({super.key});

  @override
  State<MySwaps> createState() => _MySwaps();
}

class _MySwaps extends State<MySwaps> {
  // Define hard-coded values for app demo
  static List<Garment> garments = [
    Garment("Jeans mini-skirt", "assets/images/garment_1.png", "ceh210", 2,
        "XS", 10),
    Garment("White sleeveless top", "assets/images/garment_2.png",
        "ceh210", 1, "S", 2),
    Garment(
        "Orange tank top", "assets/images/garment_3.png", "ceh210", 2, "M", 50),
    Garment("Dodgers blue t-shirt", "assets/images/garment_4.png", "sms227", 2,
        "XS", 4),
    Garment("Strapless green dress", "assets/images/garment_5.jpg", "sms227", 2,
        "S", 10),
  ];

  static String user = "ceh210";

  Widget SingleSwap(Garment garment_1, Garment garment_2) {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  Expanded(flex: 1, child: ItemDetails(garment: garment_1, show_distance: false)),
                  SizedBox(width: 10.0),
                  Expanded(flex: 1, child: ItemDetails(garment: garment_2, show_distance: true))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('SWAP'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: [
              SingleSwap(garments[0], garments[4]),
              SizedBox(height: 10.0),
              SingleSwap(garments[1], garments[3]),
              SizedBox(height: 10.0),
              SingleSwap(garments[2], garments[4]),
              SizedBox(height: 10.0),
            ])));
  }
}
