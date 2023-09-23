import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:music_player/models/song.dart';
import '../models/data.dart';

void importFolders() async {
  Data.songs.clear();
  var path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOADS);
  final dir = Directory(path);
  await for (var entity in dir.list()) {
    if (entity is File &&
        entity.path.endsWith('.mp3') &&
        !entity.path.contains('/Android/')) {
      print(entity.path);
      Data.songs.add(Song(
          path: entity.path,
          songName: entity.path.split('/').last,
          imagePath: 'assets/song.jpeg',
          artist: 'unknown'));
    }
  }
}
