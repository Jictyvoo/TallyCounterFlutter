import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeChangeButton extends StatefulWidget {
  final void Function(ThemeMode)? onThemeChanged;
  final ThemeMode originThemeMode;

  const ThemeChangeButton({
    Key? key,
    this.onThemeChanged,
    this.originThemeMode = ThemeMode.system,
  }) : super(key: key);

  @override
  State<ThemeChangeButton> createState() => _ThemeChangeButtonState();
}

class _ThemeChangeButtonState extends State<ThemeChangeButton> {
  var _isDark = false;
  var _useSystem = true;

  @override
  void initState() {
    if (widget.originThemeMode == ThemeMode.system) {
      _useSystem = true;
    } else {
      _useSystem = false;
      _isDark = widget.originThemeMode == ThemeMode.dark;
    }
    super.initState();
  }

  Icon _buildThemeIcon() {
    if (_isDark) {
      return const Icon(Icons.dark_mode);
    }
    return const Icon(Icons.light_mode);
  }

  String get _titleText {
    final localization = AppLocalizations.of(context);
    if (_useSystem) {
      return localization?.systemTheme ?? 'System Theme';
    }
    if (_isDark) {
      return localization?.darkTheme ?? 'Dark Theme';
    }
    return localization?.lightTheme ?? 'Light Theme';
  }

  void _executeChange() {
    ThemeMode mode = ThemeMode.system;
    if (!_useSystem) {
      mode = _isDark ? ThemeMode.dark : ThemeMode.light;
    }
    widget.onThemeChanged?.call(mode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: _useSystem
              ? const Icon(Icons.developer_board)
              : _buildThemeIcon(),
          title: Text(_titleText),
          trailing: Switch(
            value: _isDark,
            onChanged: (value) {
              setState(() {
                _isDark = value;
                _useSystem = false;
                _executeChange();
              });
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppLocalizations.of(context)?.useSystemTheme ??
                  "Use system theme",
            ),
            Checkbox(
              value: _useSystem,
              onChanged: (value) {
                setState(() {
                  _useSystem = value ?? _useSystem;
                  _executeChange();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
