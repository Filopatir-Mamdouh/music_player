import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

Future permisionApproval() async {
  final permision = await Permission.storage.request();
  if (permision.isGranted) {
    return true;
  } else {
    return false;
  }
}

class PermissionNotifier extends ChangeNotifier {
  PermissionNotifier();
  bool _state = false;
  bool get state => _state;
  void updatePermission() async {
    _state = await Permission.storage.isGranted;
    notifyListeners();
  }

  void requestPermission() async {
    final per = await Permission.storage.request();
    _state = per.isGranted;
    notifyListeners();
  }
}

final permissionProvider = ChangeNotifierProvider<PermissionNotifier>((ref) {
  return PermissionNotifier();
});
