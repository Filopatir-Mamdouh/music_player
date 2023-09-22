import 'package:flutter/material.dart';

class Homebage extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Homebage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(),
        leading: IconButton(
          icon: Icon(Icons.settings_brightness_sharp),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: Drawer(),
      body: Column(),
    );
  }
}
