import 'package:flutter/material.dart';

class PurposeSelector extends StatefulWidget {
  const PurposeSelector({Key? key}) : super(key: key);

  @override
  State<PurposeSelector> createState() => _PurposeSelectorState();
}

class _PurposeSelectorState extends State<PurposeSelector> {
  var _selectedPurpose = 0;

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text('Purpose $index'),
      leading: Checkbox(
        onChanged: (bool? value) {
          setState(() {
            _selectedPurpose = index;
          });
        },
        value: _selectedPurpose == index,
      ),
      onTap: () {
        setState(() {
          _selectedPurpose = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Scrollbar(
              thumbVisibility: true,
              child: CustomScrollView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  SliverFixedExtentList(
                    delegate: SliverChildBuilderDelegate(
                      _itemBuilder,
                      childCount: 10,
                    ),
                    itemExtent: 50,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('Add Purpose'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
