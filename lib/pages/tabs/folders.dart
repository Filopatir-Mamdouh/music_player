import 'package:flutter/material.dart';

class Folders extends StatelessWidget {
  const Folders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const ListTile(
              leading: Icon(Icons.play_arrow),
              title: Text("Shuffle playback"),
            ),
            for (int i = 0; i < 10; i++)
              ListTile(
                  leading: Image.asset(""),
                  title: const Text("Name"),
                  subtitle: const Text("Direction"),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.settings)))
          ],
        )
      ],
    );
  }
}
