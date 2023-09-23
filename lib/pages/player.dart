import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';



class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentSong = "Song Name";
  double songProgress = 0.0;
  Duration songDuration = Duration(seconds: 0);


  Future<void> playLocalSong() async {
    final dir = await getApplicationDocumentsDirectory();
    final localFile = '${dir.path}';

    await audioPlayer.play(localFile, isLocal: true);
    setState(() {
      isPlaying = true;
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        songDuration = duration;
      });
    }); 

    audioPlayer.onAudioPositionChanged.listen((Duration position) {
      setState(() {
        songProgress = position.inSeconds.toDouble() / songDuration.inSeconds.toDouble();
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
        title: Text("Music Player"),
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
                  style: TextStyle(fontSize: 24),
                ),
              ),
              // Song Progress Slider
              Slider(
                value: songProgress,
                onChanged: (value) {
                  final newPosition = Duration(seconds: (value * songDuration.inSeconds.toDouble()).round());
                  audioPlayer.seek(newPosition);
                  setState(() {
                    songProgress = value;
                  });
                },
              ),
              // Play, Pause, Next, and Previous Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: playPreviousSong,
                  ),
                  IconButton(
                    icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                    onPressed: isPlaying ? stopSong : () => playLocalSong(),
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next),
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
