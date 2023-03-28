import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/screens/audioscreen/view/audioscreen_ui.dart';
import 'package:untitled7/screens/bottambarscreen/provider/bottam_providerui.dart';
import 'package:untitled7/screens/bottambarscreen/view/bottam_ui.dart';
import 'package:untitled7/screens/flessscreen/view/flesscreen.dart';
import 'package:untitled7/screens/homescreen/provider/homeprovider.dart';
import 'package:untitled7/screens/homescreen/view/homeui.dart';
import 'package:untitled7/screens/serchscreen/provider/srech_providerui.dart';
import 'package:untitled7/screens/serchscreen/view/serchscreen_ui.dart';
import 'package:untitled7/screens/songlist/view/song_ui.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomBarScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => FlasScreen(),
          'bottom_bar': (context) => BottomBarScreen(),
          'home': (context) => HomeScreen(),
          'playlist': (context) => PlayListScreen(),
          'audio play':(context) => AudioPlayScreen(),
          'search':(context) => SearchScreen(),
        },
      ),
    ),
  );
}