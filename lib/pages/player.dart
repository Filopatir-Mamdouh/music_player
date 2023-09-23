import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:permission_handler/permission_handler.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentSong = "Song Name";
  double songProgress = 0.0;
  Duration songDuration = const Duration(seconds: 0);

  Future<void> playLocalSong() async {
    var status = await Permission.storage.request();
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before, but not permanently.
    }
    final dir = await getApplicationDocumentsDirectory();
    DeviceFileSource localFile =
        DeviceFileSource('/sdcard/Download/marwanmoussa.mp3');

    await audioPlayer.play(localFile);
    setState(() {
      isPlaying = true;
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        songDuration = duration;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        songProgress =
            position.inSeconds.toDouble() / songDuration.inSeconds.toDouble();
      });
    });
  }

  // Function to stop the song
  void stopSong() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  // Function for the next song
  void playNextSong() {
    // Update the current song and play the next song here
  }

  // Function for the previous song
  void playPreviousSong() {
    // Update the current song and play the previous song here
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: playPreviousSong,
                  ),
                  IconButton(
                    icon: isPlaying
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                    onPressed: () => isPlaying ? stopSong() : playLocalSong(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: playNextSong,
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
