import 'package:flutter/material.dart';

class Albums extends StatelessWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
              leading: const Icon(Icons.play_arrow),
              title: const Text("Shuffle playback"),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sort))),
          for (int i = 0; i < 10; i++)
            ListTile(
              leading: Image.asset("assets/song.jpeg", width: 200),
              title: const Text("Name"),
              subtitle: const Text("Artist"),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_right)),
            )
        ],
      ),
    );
  }
}
