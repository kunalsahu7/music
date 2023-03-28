import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../songlist/modal/modal_ui.dart';

class HomeProvider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer;
  bool check = false;
  Duration TotalDuration = Duration();

  List<Audio> PlayList1 = [
    Audio("Assets/Audio/PlayList1/AUKAAT.mp3"),
    Audio("Assets/Audio/PlayList1/Rayfal 3 Reload.mp3"),
    Audio("Assets/Audio/PlayList1/The Mafia Raaj.mp3.mp3"),
    Audio("Assets/Audio/PlayList1/Rayfale Rahda Ramade.mp3.mp3"),
    Audio("Assets/Audio/PlayList1/Rona Ser Ma.mp3.mp3"),
    Audio("Assets/Audio/PlayList1/Lagyo Prityu No Rang.mp3.mp3"),
    Audio("Assets/Audio/PlayList1/Nanpan No Nedlo.mp3.mp3"),
  ];
  List<Audio> PlayList2 = [
    Audio("Assets/Audio/PlayList2/Basti Ka Hasti.mp3"),
    Audio("Assets/Audio/PlayList2/EK DIN PYAAR.mp3"),
    Audio("Assets/Audio/PlayList2/COMPANY.mp3"),
    Audio("Assets/Audio/PlayList2/No Love.mp3"),
    Audio("Assets/Audio/PlayList2/TODH.mp3"),
    Audio("Assets/Audio/PlayList2/YALGAAR.mp3"),
  ];
  List<Audio> PlayList3 = [
    Audio("Assets/Images/PlayList3/295.mp3"),
    Audio("Assets/Images/PlayList3/BROWN MUNDE.mp3"),
    Audio("Assets/Images/PlayList3/Outlaw.mp3"),
    Audio("Assets/Images/PlayList3/SARKAR.mp3"),
  ];

  List PlayListName1 = [
    "AUKAAT",
    "Rayfal 3 Reload",
    "The Mafia Raaj",
    "Rayfale Rahda Ramade",
    "Rona Ser Ma",
    "Lagyo Prityu No Rang",
    "Nanpan No Nedlo",
  ];
  List PlayListName2 = [
    "Basti Ka Hasti",
    "EK DIN PYAAR",
    "COMPANY",
    "No Love",
    "TODH",
    "YALGAAR",
  ];
  List PlayListName3 = [
    "295",
    "Brown munde",
    "Outlaw",
    "Sarkar",
  ];

  List PlayListImage1 = [
    "Assets/Images/PlayList1/aukaat.jpg",
    "Assets/Images/PlayList1/Rayfal 3 Reload.jpg",
    "Assets/Images/PlayList1/The Mafia Raaj.jpg",
    "Assets/Images/PlayList1/Rayfale Rahda Ramade.jpg",
    "Assets/Images/PlayList1/Rona Ser Ma.jpg",
    "Assets/Images/PlayList1/Lagyo Prityu No Rang.jpg",
    "Assets/Images/PlayList1/Nanpan No Nedlo.jpg",
  ];
  List PlayListImage2 = [
    "Assets/Images/PlayList2/Basti Ka Hasti.jpg",
    "Assets/Images/PlayList2/COMPANY.jpg",
    "Assets/Images/PlayList2/EK DIN PYAAR.jpg",
    "Assets/Images/PlayList2/No Love.jpg",
    "Assets/Images/PlayList2/TODH.jpg",
    "Assets/Images/PlayList2/YALGAAR.jpg",
  ];
  List PlayListImage3 = [
    "Assets/Images/PlayList3/295.jpg",
    "Assets/Images/PlayList3/BROWN MUNDE.jpg",
    "Assets/Images/PlayList3/Outlaw.jpg",
    "Assets/Images/PlayList3/SARKAR.jpg",
  ];

  void initAudio(Model m1) {
    assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer!.open(
      Playlist(audios: m1.PlayList),
      showNotification: true,
      autoStart: false,
    );

    totalDurationAudio();
  }

  Future<void> StartAudio() async {
    await assetsAudioPlayer!.play();
  }

  Future<void> StopAudio() async {
    await assetsAudioPlayer!.pause();
  }


  Future<void> NextAudio() async {
    await assetsAudioPlayer!.next();
    notifyListeners();
  }

  Future<void> BackAudio() async {
    await assetsAudioPlayer!.previous();
    notifyListeners();
  }

  void ChechPlayButton() {
    check ? StartAudio() : StopAudio();
    check = !check;
    notifyListeners();
  }


  void totalDurationAudio() {
    assetsAudioPlayer!.current.listen((event) {
      TotalDuration = event!.audio.duration;
      notifyListeners();
    });
  }
}