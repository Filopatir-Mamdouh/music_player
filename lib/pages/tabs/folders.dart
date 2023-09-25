import 'package:flutter/material.dart';
import 'package:music_player/models/data.dart';

class Folders extends StatelessWidget {
  const Folders({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.play_arrow),
            title: Text("Shuffle playback"),
          ),
          for (int i = 0; i < Data.folders.length; i++)
            ListTile(
                leading: const Icon(Icons.folder),
                title: Text(Data.folders[i].folderName),
                subtitle: Text('${Data.folders[i].songs.length} Songs'),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.settings)))
        ],
      ),
    );
  }
}
