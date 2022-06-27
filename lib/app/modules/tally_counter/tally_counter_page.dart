import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/shared/routes.dart';

import 'pages/counter/counter_page.dart';
import 'pages/counter/widgets/purpose_selector.dart';
import 'widgets/popup_trailing.dart';

class TallyPage extends StatelessWidget {
  final String title;

  const TallyPage({Key? key, required this.title}) : super(key: key);

  Widget _buildHorizontalLayout() {
    return Row(
      children: const [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: PurposeSelector(),
          ),
        ),
        VerticalDivider(
          indent: 10,
          endIndent: 10,
        ),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: CounterPage(),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: const [
          Expanded(
            flex: 1,
            child: PurposeSelector(),
          ),
          Divider(indent: 10, endIndent: 10),
          Expanded(
            flex: 2,
            child: Center(
              child: SingleChildScrollView(
                child: CounterPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayout(BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth >= 540) {
      return _buildHorizontalLayout();
    }

    return _buildVerticalLayout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          PopupTrailing(
            onTap: (options) {
              if (options == PopupOptions.showAll) {
                Modular.to.pushNamed(AppRoutes.REGISTER_LIST.route);
              } else {
                Modular.to.pushNamed(
                  AppRoutes.REGISTER_LIST.route,
                  arguments: DateTime.now(),
                );
              }
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: _buildLayout,
      ),
    );
  }
}
