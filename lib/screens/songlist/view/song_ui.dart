import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../homescreen/provider/homeprovider.dart';
import '../modal/modal_ui.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);

    Model m1 = ModalRoute.of(context)!.settings.arguments as Model;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                transform: GradientRotation(pi / 2),
                colors: [
                  Colors.amber,
                  Colors.black,
                  Colors.black,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 250,
                      width: 250,
                      child: Image.asset(
                        "${m1.Images![0]}",
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 30,
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.play_circle,
                        color: Colors.green,
                        size: 60,
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: m1.PlayList!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Model M1 = Model(
                              Images: m1.Images!,
                              PlayList: m1.PlayList!,
                              Name: m1.Name!,
                              index: index,
                            );

                            Navigator.pushNamed(
                              context,
                              'audio play',
                              arguments: M1,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Text(
                                      "${m1.Name![index]}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    homeProviderfalse!.ChechPlayButton();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}