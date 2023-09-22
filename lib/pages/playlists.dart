import 'package:flutter/material.dart';
import 'package:music_player/utils/colors.dart';
import 'package:music_player/widgets/appbar.dart';

class PlaylistsPage extends StatelessWidget {
  const PlaylistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Playlists'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    child: const Row(
                      children: <Widget>[
                        Icon(Icons.shuffle_rounded),
                        Text('\tShuffle playback'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  const Icon(Icons.add_to_photos_outlined)
                ],
              ),
            ),
            GridView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: false,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8),
              children: [
                for (int i = 0; i < 6; i++)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/song.jpeg'),
                          const Positioned(
                            bottom: 4,
                            right: 4,
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'Song Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: secondaryColor),
                      ),
                      const Text(
                        'Total 10 Songs',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      ),
                    ],
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
