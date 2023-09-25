import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/provider/musicprovider.dart';

class MusicPlayerPage extends ConsumerWidget {
  const MusicPlayerPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    bool isPlaying = ref.watch(musicplayerProvider).isplaying;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
      ),
      body: Center(
        child: Card(
          elevation: 5.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Square Image
              Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.grey,
                  child: Image.asset('assets/song.jpeg')),
              // Song Name Text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  ref.watch(musicplayerProvider).currentplaying.songName,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              // Song Progress Slider
              // Play, Pause, Next, and Previous Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () {},
                  ),
                  IconButton(
                      icon: isPlaying
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow),
                      onPressed: () {
                        ref.read(musicplayerProvider).playmusic();
                      }),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {
                      ref.read(musicplayerProvider).playnext();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
