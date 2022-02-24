import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      title: const Text('Change Counter value'),
      content: TextField(
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
