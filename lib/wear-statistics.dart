import 'package:flutter/material.dart';

class MyWearStats extends StatefulWidget {
  const MyWearStats({super.key});

  @override
  State<MyWearStats> createState() => _MyWearStats();
}

class _MyWearStats extends State<MyWearStats> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("My Wear Statistics")
    );
  }
}
