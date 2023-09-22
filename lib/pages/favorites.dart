import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: FavoritesPage(),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<String> songs = [
    'Song 1',
    'Song 2',
    'Song 3',

  ];

  final List<String> artists = [
    'Artist 1',
    'Artist 2',
    'Artist 3',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

          },
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.music_note),

                ),
                Tab(
                  icon: Icon(Icons.star),

                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [

                  ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(songs[index]),
                          subtitle: Text(artists[index]),
                          onTap: () {

                          },
                        ),
                      );
                    },
                  ),

                  ListView.builder(
                    itemCount: artists.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(artists[index]),
                          onTap: () {

                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
