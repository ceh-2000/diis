import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:diis/garment.dart';
import 'package:diis/item_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'data.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfile();
}

class _MyProfile extends State<MyProfile> {
  List<charts.Series<Garment, String>> garmentData = [
    charts.Series(
        id: "Garments",
        data: garments,
        domainFn: (Garment garment, _) => garment.short_name,
        measureFn: (Garment garment, _) => garment.num_wears,
        colorFn: (Garment garment, _) => charts.ColorUtil.fromDartColor(Colors.deepPurple)
    )
  ];

  Widget _buildPopupDialog(BuildContext context, Garment garment) {
    return new AlertDialog(
      title: Text(garment.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: ItemDetails(garment: garment, show_distance: false),
          ),
        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    if (selectedDatum.isNotEmpty) {
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context, selectedDatum.first.datum),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20.0), child: Column(children: [
      Expanded(
          flex: 1,
          child: Row(children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: min(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.height / 2),
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: Clare Heinbaugh", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10.0),
                      Text("Username: ceh210"),
                      SizedBox(height: 10.0),
                      Text("Date joined: March 7, 2024"),
                      SizedBox(height: 10.0),
                      Text("Number of total swaps ever: 25"),
                      SizedBox(height: 10.0),
                      Text("Number of friends: 190"),
                      SizedBox(height: 10.0),
                      Text("Size: Medium"),
                      SizedBox(height: 10.0),
                    ]))
          ])),
      Expanded(flex: 1, child: Row(
          children: [
            RotatedBox(
                quarterTurns: 3,
                child: new Text("Number of wears")
            ),
            Expanded(flex: 1, child: charts.BarChart(garmentData,
                selectionModels: [
                  charts.SelectionModelConfig(
                    type: charts.SelectionModelType.info,
                    changedListener: _onSelectionChanged,
                  )
                ],
                animate: true))
          ]
      ))
    ]));
  }
}
