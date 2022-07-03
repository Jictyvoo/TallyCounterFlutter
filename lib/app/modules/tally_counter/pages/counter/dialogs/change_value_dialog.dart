import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tally_counter/app/modules/tally_counter/l10n/tally_counter_localizations.dart';

class ChangeValueDialog extends StatelessWidget {
  final TextEditingController _setValueController;
  final void Function(String)? changeValue;

  ChangeValueDialog({Key? key, this.changeValue, int initialValue = 0})
      : _setValueController = TextEditingController(
          text: initialValue.toString(),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        TallyCounterLocalizations.of(context).counterChangeDialogTitle,
      ),
      content: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: _setValueController,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            changeValue?.call(_setValueController.value.text);
          },
          child: const Text('Ok'),
        )
      ],
    );
  }
}
