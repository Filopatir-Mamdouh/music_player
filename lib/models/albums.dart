// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'song.dart';

class Albums {
  String albumName;
  String albumPic;
  List<Song> songs;
  Albums({
    required this.albumName,
    required this.albumPic,
    required this.songs,
  });

  Albums copyWith({
    String? albumName,
    String? albumPic,
    List<Song>? songs,
  }) {
    return Albums(
      albumName: albumName ?? this.albumName,
      albumPic: albumPic ?? this.albumPic,
      songs: songs ?? this.songs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumName': albumName,
      'albumPic': albumPic,
      'songs': songs.map((x) => x.toMap()).toList(),
    };
  }

  factory Albums.fromMap(Map<String, dynamic> map) {
    return Albums(
      albumName: map['albumName'] as String,
      albumPic: map['albumPic'] as String,
      songs: List<Song>.from(
        (map['songs'] as List<int>).map<Song>(
          (x) => Song.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Albums.fromJson(String source) =>
      Albums.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Albums(albumName: $albumName, albumPic: $albumPic, songs: $songs)';

  @override
  bool operator ==(covariant Albums other) {
    if (identical(this, other)) return true;

    return other.albumName == albumName &&
        other.albumPic == albumPic &&
        listEquals(other.songs, songs);
  }

  @override
  int get hashCode => albumName.hashCode ^ albumPic.hashCode ^ songs.hashCode;
}
