// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Song {
  String path;
  String songName;
  String imagePath;
  String artist;
  Song({
    required this.path,
    required this.songName,
    required this.imagePath,
    required this.artist,
  });

  Song copyWith({
    String? path,
    String? songName,
    String? imagePath,
    String? artist,
  }) {
    return Song(
      path: path ?? this.path,
      songName: songName ?? this.songName,
      imagePath: imagePath ?? this.imagePath,
      artist: artist ?? this.artist,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'songName': songName,
      'imagePath': imagePath,
      'artist': artist,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      path: map['path'] as String,
      songName: map['songName'] as String,
      imagePath: map['imagePath'] as String,
      artist: map['artist'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) =>
      Song.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Song(path: $path, songName: $songName, imagePath: $imagePath, artist: $artist)';
  }

  @override
  bool operator ==(covariant Song other) {
    if (identical(this, other)) return true;

    return other.path == path &&
        other.songName == songName &&
        other.imagePath == imagePath &&
        other.artist == artist;
  }

  @override
  int get hashCode {
    return path.hashCode ^
        songName.hashCode ^
        imagePath.hashCode ^
        artist.hashCode;
  }
}
