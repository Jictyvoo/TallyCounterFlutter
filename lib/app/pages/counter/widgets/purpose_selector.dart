import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tally_counter/app/core/domain/models/dtos/purpose_dto.dart';
import 'package:tally_counter/app/pages/counter/purpose_store.dart';

import '../dialogs/create_purpose_dialog.dart';

class PurposeSelector extends StatefulWidget {
  final void Function(PurposeDTO)? onPurposeSelected;

  const PurposeSelector({Key? key, this.onPurposeSelected}) : super(key: key);

  @override
  State<PurposeSelector> createState() => _PurposeSelectorState();
}

class _PurposeSelectorState extends State<PurposeSelector> {
  late final PurposeStore _purposeStore;

  void _reloadPurposes() {
    _purposeStore.loadPurposes().then((purposes) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  initState() {
    super.initState();
    _purposeStore = Modular.get<PurposeStore>();
    _reloadPurposes();
  }

  void _addPurposeHandler() {
    showDialog(
      context: context,
      builder: (context) => CreatePurposeDialog(
        onFormSubmit: (name, description) {
          final newPurpose = PurposeDTO(
            name: name,
            description: description,
          );
          _purposeStore.addPurpose(newPurpose, true).then((success) {
            if (success) {
              setState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to add purpose'),
                ),
              );
            }
          });
        },
      ),
    );
  }

  void _handleSelection(int index) {
    final selectedPurpose = _purposeStore.getPurposeAt(index);
    widget.onPurposeSelected?.call(selectedPurpose);
    _purposeStore.purpose = index;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text(_purposeStore.getPurposeAt(index).name),
      leading: Checkbox(
        onChanged: null,
        value: _purposeStore.purposeIndex == index,
      ),
      onTap: () {
        setState(() {
          _handleSelection(index);
        });
      },
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _addPurposeHandler,
              child: const Text('Add Purpose'),
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
              itemCount: _purposeStore.size,
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
                    childCount: _purposeStore.size,
                  ),
                  itemExtent: 50,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: _addPurposeHandler,
                  child: const Text('Add Purpose'),
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
