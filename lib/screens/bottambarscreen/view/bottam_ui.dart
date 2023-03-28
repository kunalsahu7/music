import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottam_providerui.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  BottomBarScreenProvider? bottomBarScreenProviderfalse;
  BottomBarScreenProvider? bottomBarScreenProvidertrue;

  @override
  Widget build(BuildContext context) {
    bottomBarScreenProviderfalse =
        Provider.of<BottomBarScreenProvider>(context, listen: false);
    bottomBarScreenProvidertrue =
        Provider.of<BottomBarScreenProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: bottomBarScreenProviderfalse!
            .Screens[bottomBarScreenProvidertrue!.i],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomBarScreenProvidertrue!.i,
          onTap: (value) {
            bottomBarScreenProviderfalse!.changePahe(value);
          },
          mouseCursor: MouseCursor.uncontrolled,
          selectedFontSize: 20,
          selectedIconTheme: IconThemeData(color: Colors.white, size: 40),
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              label: "Games",
              icon: Icon(Icons.gamepad_outlined),
            ),
            BottomNavigationBarItem(
              label: "Apps",
              icon: Icon(Icons.gamepad_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
