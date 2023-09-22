import 'package:flutter/material.dart';
import 'package:music_player/widgets/appbar.dart';

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Recent'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    child: const Row(
                      children: <Widget>[
                        Icon(Icons.play_circle_fill_outlined),
                        Text('\tShuffle playback'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  const Icon(Icons.delete_sweep_outlined)
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.graphic_eq_sharp),
              title: Text(
                'Current Playing Song',
              ),
              subtitle: Row(children: [
                Icon(Icons.phone_android),
                Text('Unknown artist\t|'),
                Expanded(
                  child: Text('\tCurrent playing Album',
                      softWrap: true, overflow: TextOverflow.ellipsis),
                )
              ]),
              trailing: Icon(Icons.more_vert),
            ),
            for (int i = 2; i < 6; i++)
              ListTile(
                leading: Text('0$i'),
                title: const Text(
                  'Next Playing Song',
                ),
                subtitle: const Row(children: [
                  Icon(Icons.phone_android),
                  Text('Unknown artist\t|'),
                  Expanded(
                    child: Text('\tCurrent playing Album',
                        softWrap: true, overflow: TextOverflow.ellipsis),
                  ),
                ]),
                trailing: const Icon(Icons.more_vert),
              ),
          ],
        ),
      ),
    );
  }
}
