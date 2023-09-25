import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/models/data.dart';
import 'package:music_player/pages/player.dart';
import 'package:music_player/provider/musicprovider.dart';

class Songs extends ConsumerWidget {
  const Songs({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.play_arrow),
            title: const Text("Shuffle playback"),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.autofps_select))
                ],
              ),
            ),
          ),
          for (int i = 0; i < Data.songs.length; i++)
            InkWell(
              onTap: () {
                ref
                    .read(musicplayerProvider)
                    .currentPlayingList([Data.songs[i]]);
                ref.read(musicplayerProvider).playmusic();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const MusicPlayerPage()));
              },
              child: ListTile(
                leading: Image.asset('assets/song.jpeg'),
                title: Text(Data.songs[i].songName),
                subtitle: Text(Data.songs[i].artist),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.share)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.settings))
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
