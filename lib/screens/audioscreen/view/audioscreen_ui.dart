import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../homescreen/provider/homeprovider.dart';
import '../../songlist/modal/modal_ui.dart';

class AudioPlayScreen extends StatefulWidget {
  const AudioPlayScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayScreen> createState() => _AudioPlayScreenState();
}

class _AudioPlayScreenState extends State<AudioPlayScreen> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);

    Model m1 = ModalRoute.of(context)!.settings.arguments as Model;
    Provider.of<HomeProvider>(context, listen: false).initAudio(m1);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Container(
                width: 400,
                height: 400,
                child: Image.asset(
                  "${m1.Images![m1.index!]}",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 50),
              PlayerBuilder.currentPosition(
                player: homeProviderfalse!.assetsAudioPlayer!,
                builder: (context, position) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${m1.Name![m1.index!]}",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: Slider(
                          value: position.inSeconds.toDouble(),
                          onChanged: (value) {
                            homeProviderfalse!.assetsAudioPlayer!.seek(
                              Duration(
                                seconds: value.toInt(),
                              ),
                            );
                          },
                          max: homeProviderfalse!.TotalDuration.inSeconds
                              .toDouble(),
                          autofocus: true,
                          thumbColor: Colors.white,
                          activeColor: Colors.white70,
                          inactiveColor: Colors.white10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${position.inMinutes} : ${position.inSeconds.toInt()}",
                              style:
                              TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              "${homeProviderfalse!.TotalDuration.inMinutes} : ${homeProviderfalse!.TotalDuration.inSeconds}",
                              style:
                              TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              homeProviderfalse!.BackAudio();
                            },
                            icon: Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () {
                                homeProviderfalse!.ChechPlayButton();
                              },
                              child: Icon(
                                homeProvidertrue!.check
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              homeProviderfalse!.NextAudio();
                            },
                            icon: Icon(
                              Icons.skip_next,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}