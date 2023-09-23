import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/pages/home.dart';

import '../provider/musicprovider.dart';

class PermissionChecker extends StatelessWidget {
  const PermissionChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.read(permissionProvider).updatePermission();
        bool isDisabled = ref.watch(permissionProvider).state;
        print('$isDisabled');
        return AlertDialog(
          title: const Text('Permission Checking'),
          actions: [
            TextButton(
              onPressed: isDisabled
                  ? () {}
                  : () async {
                      print('${ref.watch(permissionProvider).state}');
                      ref.read(permissionProvider).requestPermission();
                    },
              child: const Text('Ask For Permissions'),
            ),
            MaterialButton(
              onPressed: () async {
                if (isDisabled) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (builder) => HomePage()));
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
      },
    );
  }
}
