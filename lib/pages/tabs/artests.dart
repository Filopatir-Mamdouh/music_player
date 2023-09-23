import 'package:flutter/material.dart';

class Artists extends StatelessWidget {
  const Artists({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.play_circle_fill_outlined),
                      Text('\tShuffle playback'),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          for (int i = 2; i < 6; i++)
            const ListTile(
              title: Text(
                'Artist Name',
              ),
              subtitle: Text('10 Songs'),
              trailing: Icon(Icons.more_vert),
            ),
        ],
      ),
    );
  }
}
