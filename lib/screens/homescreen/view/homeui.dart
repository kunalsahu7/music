import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../songlist/modal/modal_ui.dart';
import '../provider/homeprovider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 15, left: 20),
            child: Text(
              "Good Evening",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.notification_add,
                    size: 30,
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.timer_outlined,
                    size: 30,
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ],
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Music",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 45,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Prduct & Shows",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "${homeProviderfalse!.PlayListImage1[0]}",
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              Model m1 = Model(
                                Name: homeProviderfalse!.PlayListName1,
                                Images: homeProviderfalse!.PlayListImage1,
                                PlayList: homeProviderfalse!.PlayList1,
                              );
                              Navigator.pushNamed(context, 'playlist',
                                  arguments: m1);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "${homeProviderfalse!.PlayListImage1[0]}",
                                      height: 70,
                                      width: 70,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Gujarati Song",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "PlayList",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${homeProviderfalse!.PlayList1.length} Songs",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "${homeProviderfalse!.PlayListImage2[0]}",
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              Model m1 = Model(
                                Name: homeProviderfalse!.PlayListName2,
                                Images: homeProviderfalse!.PlayListImage2,
                                PlayList: homeProviderfalse!.PlayList2,
                              );
                              Navigator.pushNamed(context, 'playlist',
                                  arguments: m1);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "${homeProviderfalse!.PlayListImage2[0]}",
                                      height: 70,
                                      width: 70,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Gujarati Song",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "PlayList",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${homeProviderfalse!.PlayList2.length} Songs",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "${homeProviderfalse!.PlayListImage3[0]}",
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              Model m1 = Model(
                                Name: homeProviderfalse!.PlayListName3,
                                Images: homeProviderfalse!.PlayListImage3,
                                PlayList: homeProviderfalse!.PlayList3,
                              );
                              Navigator.pushNamed(context, 'playlist',
                                  arguments: m1);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "${homeProviderfalse!.PlayListImage3[0]}",
                                      height: 70,
                                      width: 70,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Gujarati Song",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "PlayList",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${homeProviderfalse!.PlayList3.length} Songs",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}