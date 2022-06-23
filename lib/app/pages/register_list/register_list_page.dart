import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(
      initialIndex: _selectedTabIndex,
      length: _availableDates.length,
      vsync: this,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of registers'),
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
          final result = await widget.store?.exportCSV(
            _selectedDate ?? DateTime.now(),
          );

          if (result == false) {
            showDialog(
              context: context,
              builder: (subContext) {
                return AlertDialog(
                  title: const Text('Alert'),
                  content: Text(
                    'Cant export registers from `$_selectedDate`\n'
                    'Method Unimplemented, check for new versions',
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
          } else {
            showDialog(
              context: context,
              builder: (subContext) {
                return AlertDialog(
                  title: const Text('Alert'),
                  content: const Text('Registers exported successfully'),
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
        },
        tooltip: 'Save register list to a csv file',
        child: const Icon(Icons.save),
      ),
    );
  }
}
