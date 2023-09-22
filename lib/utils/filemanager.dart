import 'package:flutter/material.dart';

class PermissionNotifier extends ChangeNotifier {
  bool _filepermission = false;
  bool get filePermisions => _filepermission;
}
