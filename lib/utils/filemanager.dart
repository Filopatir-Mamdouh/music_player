import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/pages/home.dart';
import 'package:music_player/utils/folders.dart';
import '../provider/musicprovider.dart';

Widget permissionChecker() {
  return Consumer(builder: (context, ref, child) {
    ref.read(permissionProvider).updatePermission();
    bool isDisabled = ref.watch(permissionProvider).state;
    print('$isDisabled WTF');
    return AlertDialog(
      title: const Text('Permission Checking'),
      actions: [
        TextButton(
          onPressed: isDisabled
              ? () {}
              : () async {
                  ref.read(permissionProvider).requestPermission();
                },
          child: Text(isDisabled ? '' : 'Ask For Permissions'),
        ),
        MaterialButton(
          onPressed: () async {
            if (isDisabled) {
              importFolders();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (builder) => HomePage()));
            } else {
              exit(0);
            }
          },
          child: const Text('Close'),
        )
      ],
      content: Text(isDisabled
          ? 'Have Fun ^_^'
          : 'Please Give Us Permission\nI BEG YOU :\'C'),
    );
  });
}
