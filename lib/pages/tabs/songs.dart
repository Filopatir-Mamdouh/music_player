import 'package:flutter/material.dart';

class Songs extends StatelessWidget {
  const Songs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ListTile(
              leading: const Icon(Icons.play_arrow),
              title: const Text("Shuffle playback"),
              trailing: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.autofps_select))
                ],
              ),
            ),
            for (int i = 0; i < 10; i++)
              ListTile(
                leading: Image.asset(""),
                title: const Text("Name"),
                subtitle: const Text("Artist"),
                trailing: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.settings))
                  ],
                ),
              )
          ],
        )
      ],
    );
  }
}
