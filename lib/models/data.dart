import 'folder.dart';
import 'playlist.dart';
import 'albums.dart';
import 'song.dart';
import 'recent.dart';
import 'Favourits.dart';

class Data {
  static List<Albums> albums = [];
  static List<Recent> recents = [];
  static List<Song> songs = [];
  static List<Folder> folders = [];
  static List<Playlist> playlists = [];
  static List<Favourits> favourits = [];

  static void updateFolders() {
    for (var song in songs) {
      bool found = false;
      Map<String, Song> folder = {};
      int index = song.path.split('/').length - 2;
      String fname = song.path.split('/')[index];
      print(fname);
      folder[fname] = song;
      Data.folders.forEach((element) {
        if (element.folderName == folder.entries.first.key) {
          if (!element.songs.contains(song)) {
            element.songs.add(folder.entries.first.value);
          }
          found = true;
        }
      });
      if (!found) {
        Data.folders.add(Folder(folderName: fname, songs: [song]));
      }
    }
    print(folders.first);
  }
}
