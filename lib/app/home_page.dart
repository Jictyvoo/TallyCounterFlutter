import 'package:flutter/material.dart';

import 'pages/counter/counter_page.dart';
import 'pages/counter/counter_store.dart';
import 'pages/register_list/register_list_page.dart';
import 'pages/register_list/register_list_store.dart';
import 'widgets/popup_trailing.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupTrailing(
            onTap: (options) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterListPage(
                    store: RegisterListStore(CounterStore.repository),
                  ),settings: RouteSettings(name: 'list')
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            CounterPage(),
          ],
        ),
      ),
    );
  }
}
