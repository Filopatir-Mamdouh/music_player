import 'package:audioplayers/audioplayers.dart';

import '../models/song.dart';

class MusicPlayer {
  static AudioPlayer audioPlayer = AudioPlayer();

  static playsong(Song currentplaying) async {
    await audioPlayer.play(DeviceFileSource(currentplaying.path));
  }

  static stopSong() async {
    await audioPlayer.stop();
  }
}
