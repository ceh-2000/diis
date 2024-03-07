import 'package:flutter/material.dart';

import 'garment.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    this.garment,
    this.show_distance,
    this.child,
  });

  final Widget? child;
  final Garment? garment;
  final bool? show_distance;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(garment!.image_path),
      ),
      ListTile(
        title: Text(garment!.name),
        subtitle: show_distance!
            ? Text("Size: " +
                garment!.size +
                "\nNumber of wears: " +
                garment!.num_wears.toString() +
                "\nDistance to swap: " +
                garment!.owner_distance.toString() +
                " km")
            : Text("Size: " +
                garment!.size +
                "\nNumber of wears: " +
                garment!.num_wears.toString() +
                "\n"),
      ),
    ]);
  }
}
