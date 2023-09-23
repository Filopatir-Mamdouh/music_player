import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
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
      var metadata = await MetadataRetriever.fromFile(File(entity.path));
      print('here' + (metadata.authorName ?? 'unknkown'));
      Data.songs.add(Song(
          path: entity.path,
          songName: entity.path.split('/').last,
          imagePath: 'assets/song.jpeg',
          artist: 'unknown'));
    }
  }
}
