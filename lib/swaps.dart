import 'package:diis/garment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'item_details.dart';

class MySwaps extends StatefulWidget {
  const MySwaps({super.key});

  @override
  State<MySwaps> createState() => _MySwaps();
}

class _MySwaps extends State<MySwaps> {
  Widget SingleSwap(Garment garment_1, Garment garment_2) {
    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
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
                      child: const Text('SWAP', style: TextStyle(fontSize: 15.0),),
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
              for (var garmentPair in garmentPairs) Column(children: [SingleSwap(garmentPair.item2, garmentPair.item1), SizedBox(height: 10)])
            ])));
  }
}
