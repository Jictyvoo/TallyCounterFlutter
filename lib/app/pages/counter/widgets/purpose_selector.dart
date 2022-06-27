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

  Widget _buildHorizontalLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: null,
              child: Text('Add Purpose'),
            ),
          ),
        ),
        const VerticalDivider(
          indent: 10,
          endIndent: 10,
        ),
        Expanded(
          flex: 2,
          child: Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
              itemCount: 11,
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              itemBuilder: _itemBuilder,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Scrollbar(
            thumbVisibility: true,
            child: CustomScrollView(
              shrinkWrap: true,
              controller: ScrollController(),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight >= 400 || constraints.maxWidth < 280) {
        return _buildVerticalLayout();
      }

      return _buildHorizontalLayout();
    });
  }
}
