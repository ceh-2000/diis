import 'package:diis/garment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'item_details.dart';

class NewClothes extends StatefulWidget {
  const NewClothes({super.key});

  @override
  State<NewClothes> createState() => _NewClothes();
}

class _NewClothes extends State<NewClothes> {
  Widget SingleItem(Garment garment) {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ItemDetails(garment: garment, show_distance: true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {/* ... */},
                    ),
                    TextButton(
                      child: Icon(Icons.bookmark_border_rounded,
                          color: Theme.of(context).colorScheme.primary),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget IconTextButton(Icon icon, String text) {
    return ElevatedButton(
        onPressed: () {},
        child: Wrap(children: [
          icon,
          SizedBox(width: 3.0),
          Padding(padding: EdgeInsets.only(top: 2.0), child: Text(text))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10.0),
      Expanded(
        flex: 1,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              SizedBox(width: 5.0),

              IconTextButton(
                  Icon(Icons.favorite, color: Colors.red), "Favorites"),
              SizedBox(width: 5.0),
              IconTextButton(
                  Icon(Icons.bookmark_rounded,
                      color: Theme.of(context).colorScheme.primary),
                  "Saved"),
              SizedBox(width: 5.0),
              IconTextButton(
                  Icon(Icons.whatshot, color: Colors.orange), "Popular"),
              SizedBox(width: 5.0),
              IconTextButton(
                  Icon(Icons.location_on,
                      color: Theme.of(context).colorScheme.primary),
                  "Close by"),
              SizedBox(width: 5.0),
              IconTextButton(
                  Icon(Icons.checkroom_rounded,
                      color: Theme.of(context).colorScheme.primary),
                  "Size SMALL"),
              SizedBox(width: 5.0),
              IconTextButton(
                  Icon(Icons.people,
                      color: Theme.of(context).colorScheme.primary),
                  "Friends"),
              SizedBox(width: 5.0),
            ])),
      ),
      SizedBox(height: 10.0),
      Expanded(
          flex: 20,
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(children: [
                    for(var item in garments) Column(children: [SingleItem(item), SizedBox(height: 10)])
                  ]))))
    ]);
  }
}
