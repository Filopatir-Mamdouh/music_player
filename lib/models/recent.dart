// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:music_player/models/song.dart';

class Recent {
  List<Song> songs;
  Recent({
    required this.songs,
  });

  Recent copyWith({
    List<Song>? songs,
  }) {
    return Recent(
      songs: songs ?? this.songs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'songs': songs.map((x) => x.toMap()).toList(),
    };
  }

  factory Recent.fromMap(Map<String, dynamic> map) {
    return Recent(
      songs: List<Song>.from(
        (map['songs'] as List<int>).map<Song>(
          (x) => Song.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recent.fromJson(String source) =>
      Recent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Recent(songs: $songs)';

  @override
  bool operator ==(covariant Recent other) {
    if (identical(this, other)) return true;

    return listEquals(other.songs, songs);
  }

  @override
  int get hashCode => songs.hashCode;
}
