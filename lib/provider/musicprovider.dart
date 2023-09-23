import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/utils/musicplayer.dart';
import 'package:permission_handler/permission_handler.dart';

Future permisionApproval() async {
  final permision = await Permission.storage.request();
  if (permision.isGranted) {
    return true;
  } else {
    return false;
  }
}

class PermissionNotifier extends ChangeNotifier {
  PermissionNotifier();
  bool _state = false;
  bool get state => _state;
  void updatePermission() async {
    _state = await Permission.storage.isGranted;
    notifyListeners();
  }

  void requestPermission() async {
    final per = await Permission.storage.request();
    _state = per.isGranted;
    notifyListeners();
  }
}

final permissionProvider = ChangeNotifierProvider<PermissionNotifier>((ref) {
  return PermissionNotifier();
});

class MusicPlayerNotifier extends ChangeNotifier {
  bool _isplaying = false;
  int _index = 0;
  List<Song> _playingList = [
    Song(path: '', songName: '', imagePath: '', artist: '')
  ];
  bool get isplaying => _isplaying;
  Song get currentplaying => _playingList[_index];

  void playmusic() async {
    _isplaying = !_isplaying;
    if (_isplaying) {
      MusicPlayer.playsong(currentplaying);
    } else {
      MusicPlayer.stopSong();
    }
    notifyListeners();
  }

  void playnext() {
    _index++;
    notifyListeners();
  }

  void currentPlayingList(List<Song> list) {
    _playingList = list;
    _index = 0;
    notifyListeners();
  }
}

final musicplayerProvider = ChangeNotifierProvider<MusicPlayerNotifier>((ref) {
  return MusicPlayerNotifier();
});
