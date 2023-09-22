import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.mic_none),
              hintText: 'Search songs , playlist and artists'),
          cursorRadius: Radius.circular(25),
        ),
        leading: IconButton(
          icon: Icon(Icons.settings_brightness_sharp),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: Text(''),
      ),
      body: Column(),
    );
  }
}
