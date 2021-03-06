import 'dart:io';

import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tally_counter/app/core/infra/providers/file_save_provider.dart';
import 'package:tally_counter/app/modules/tally_counter/l10n/tally_counter_localizations.dart';

import 'register_list_store.dart';
import 'widgets/register_list_loader_widget.dart';

class RegisterListPage extends StatefulWidget {
  final RegisterListStore? store;
  final DateTime? fromDate;

  const RegisterListPage({Key? key, this.store, this.fromDate})
      : super(key: key);

  @override
  State<RegisterListPage> createState() => _RegisterListPageState();
}

class _RegisterListPageState extends State<RegisterListPage>
    with TickerProviderStateMixin {
  int _selectedTabIndex = 0;
  List<DateTime> _availableDates = const [];

  DateTime? get _selectedDate {
    if (widget.fromDate != null) {
      return widget.fromDate;
    }
    if (_selectedTabIndex < _availableDates.length) {
      return _availableDates[_selectedTabIndex];
    }
    return null;
  }

  @override
  void initState() {
    if (widget.store != null) {
      if (widget.fromDate != null) {
        _availableDates = [widget.fromDate!];
      } else {
        widget.store!.loadAllDates().then((value) {
          setState(() {
            _availableDates = value;
          });
        });
      }
    }
    super.initState();
  }

  List<Tab> _buildDateTabs(List<DateTime> dateList) {
    return [
      for (final date in dateList)
        Tab(
          child: Text(
            DateFormat.yMd().format(date),
          ),
        )
    ];
  }

  void _onTabSelected(index) {
    _selectedTabIndex = index;
  }

  Widget _buildExportFailDialog(subContext) {
    return AlertDialog(
      title: Text(
        TallyCounterLocalizations.of(context).failure,
      ),
      content: Text(
        TallyCounterLocalizations.of(context).tallyRegistersExportError(
          _selectedDate!,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(
      initialIndex: _selectedTabIndex,
      length: _availableDates.length,
      vsync: this,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TallyCounterLocalizations.of(context).tallyListTitle,
        ),
        bottom: TabBar(
          isScrollable: _availableDates.length > 1,
          controller: tabController,
          tabs: _buildDateTabs(_availableDates),
          onTap: _availableDates.length > 1 ? _onTabSelected : null,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (final date in _availableDates)
            RegisterListLoader(store: widget.store, fromDate: date),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'increment_button@HERO',
        onPressed: () async {
          String? path = '';

          if (!kIsWeb) {
            path = await FilesystemPicker.open(
              title: TallyCounterLocalizations.of(context).tallySaveToFolder,
              context: context,
              rootDirectory: Directory(await FileSaveProvider.directoryPath),
              fsType: FilesystemType.folder,
              pickText: TallyCounterLocalizations.of(context).tallySavePickText,
              fileTileSelectMode: FileTileSelectMode.wholeTile,
              folderIconColor: Colors.teal,
            );
          }

          var result = '';
          if (path != null) {
            result = await widget.store?.exportCSV(
                  _selectedDate ?? DateTime.now(),
                  outputFolder: path,
                ) ??
                '';
            if (result.isEmpty) {
              showDialog(
                context: context,
                builder: _buildExportFailDialog,
              );
            } else {
              showDialog(
                context: context,
                builder: (subContext) {
                  return AlertDialog(
                    title: Text(
                      TallyCounterLocalizations.of(context).success,
                    ),
                    content: SelectableText.rich(
                      TextSpan(
                        text: '${TallyCounterLocalizations.of(
                          context,
                        ).tallyRegistersExported}:\n\n',
                        children: [
                          TextSpan(
                            text: '`$result`',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ok'),
                      )
                    ],
                  );
                },
              );
            }
          }
        },
        tooltip:
            TallyCounterLocalizations.of(context).tallyRegisterExportTooltip,
        child: const Icon(Icons.save),
      ),
    );
  }
}
