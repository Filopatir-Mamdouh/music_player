// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'song.dart';

class Folder {
  String folderName;
  List<Song> songs;
  Folder({
    required this.folderName,
    required this.songs,
  });

  Folder copyWith({
    String? folderName,
    List<Song>? songs,
  }) {
    return Folder(
      folderName: folderName ?? this.folderName,
      songs: songs ?? this.songs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folderName': folderName,
      'songs': songs.map((x) => x.toMap()).toList(),
    };
  }

  factory Folder.fromMap(Map<String, dynamic> map) {
    return Folder(
      folderName: map['folderName'] as String,
      songs: List<Song>.from(
        (map['songs'] as List<int>).map<Song>(
          (x) => Song.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Folder.fromJson(String source) =>
      Folder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Folder(folderName: $folderName, songs: $songs)';

  @override
  bool operator ==(covariant Folder other) {
    if (identical(this, other)) return true;

    return other.folderName == folderName && listEquals(other.songs, songs);
  }

  @override
  int get hashCode => folderName.hashCode ^ songs.hashCode;
}
