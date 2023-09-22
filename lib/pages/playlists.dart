import 'package:flutter/material.dart';
import 'package:music_player/utils/colors.dart';

class Playlists extends StatelessWidget {
  const Playlists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'),
        backgroundColor: mobileBackgroundColor,
      ),
    );
  }
}
