// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'song.dart';

class Playlist {
  String name;
  List<Song> songs;
  late int size;
  Playlist({
    required this.name,
    required this.songs,
  }) {
    size = songs.length;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'songs': songs.map((x) => x.toMap()).toList(),
      'size': size,
    };
  }

  factory Playlist.fromMap(Map<String, dynamic> map) {
    return Playlist(
      name: map['name'] as String,
      songs: List<Song>.from(
        (map['songs'] as List<int>).map<Song>(
          (x) => Song.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Playlist.fromJson(String source) =>
      Playlist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Playlist(name: $name, songs: $songs, size: $size)';

  @override
  bool operator ==(covariant Playlist other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.songs, songs);
  }

  @override
  int get hashCode => name.hashCode ^ songs.hashCode ^ size.hashCode;
}
