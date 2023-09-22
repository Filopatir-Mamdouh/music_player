// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:music_player/models/song.dart';

class Favourits {
  List<Song> songs;
  Favourits({
    required this.songs,
  });

  Favourits copyWith({
    List<Song>? songs,
  }) {
    return Favourits(
      songs: songs ?? this.songs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'songs': songs.map((x) => x.toMap()).toList(),
    };
  }

  factory Favourits.fromMap(Map<String, dynamic> map) {
    return Favourits(
      songs: List<Song>.from(
        (map['songs'] as List<int>).map<Song>(
          (x) => Song.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Favourits.fromJson(String source) =>
      Favourits.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Favourits(songs: $songs)';

  @override
  bool operator ==(covariant Favourits other) {
    if (identical(this, other)) return true;

    return listEquals(other.songs, songs);
  }

  @override
  int get hashCode => songs.hashCode;
}
