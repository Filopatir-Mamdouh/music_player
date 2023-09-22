import 'package:flutter/material.dart';

class Albums extends StatelessWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ListTile(
                leading: const Icon(Icons.play_arrow),
                title: const Text("Shuffle playback"),
                trailing:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sort))),
            for (int i = 0; i < 10; i++)
              ListTile(
                leading: Image.asset(""),
                title: const Text("Name"),
                subtitle: const Text("Artist"),
                trailing: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_right)),
                  ],
                ),
              )
          ],
        )
      ],
    );
  }
}
