import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/provider/musicprovider.dart';
import 'package:music_player/utils/musicplayer.dart';

class MusicPlayerPage extends ConsumerWidget {
  MusicPlayerPage({super.key});

  AudioPlayer audioPlayer = AudioPlayer();

  String currentSong = "Song Name";

  double songProgress = 0.0;

  Duration songDuration = const Duration(seconds: 0);
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
              ),
              // Song Name Text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  currentSong,
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
                    onPressed: () => isPlaying
                        ? MusicPlayer.stopSong()
                        : MusicPlayer.playsong(
                            ref.watch(musicplayerProvider).currentplaying),
                  ),
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
