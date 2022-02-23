import 'package:flutter/material.dart';

import 'home_page.dart';

class TallyApp extends StatelessWidget {
  const TallyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tally Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tally Counter App'),
    );
  }
}
