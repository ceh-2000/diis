import 'package:diis/clothes.dart';
import 'package:diis/profile.dart';
import 'package:diis/swaps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'garment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF36013F)),
          useMaterial3: true,
          textTheme: TextTheme(
              displayLarge: GoogleFonts.openSans(
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: GoogleFonts.openSans(
                fontSize: 30,
              ),
              bodyMedium: GoogleFonts.openSans(),
              displaySmall: GoogleFonts.openSans())),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;

  static final List<Widget> _widgetOptions = <Widget>[
    NewClothes(),
    MySwaps(),
    MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swap Shopper'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type : BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.checkroom_rounded),
            label: 'New Clothes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_rounded),
            label: 'Swaps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
