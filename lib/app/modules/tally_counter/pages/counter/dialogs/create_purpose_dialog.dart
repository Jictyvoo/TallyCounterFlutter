import 'package:flutter/material.dart';
import 'package:tally_counter/app/modules/tally_counter/l10n/tally_counter_localizations.dart';

class CreatePurposeDialog extends StatelessWidget {
  final TextEditingController _nameController;
  final TextEditingController _descriptionController;
  final void Function(String, String)? onFormSubmit;

  CreatePurposeDialog({Key? key, this.onFormSubmit})
      : _nameController = TextEditingController(),
        _descriptionController = TextEditingController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        TallyCounterLocalizations.of(context).purposeDialogTitle,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLength: 36,
              decoration: InputDecoration(
                labelText: TallyCounterLocalizations.of(context)
                    .purposeDialogNameLabel,
                counterText: '',
              ),
              controller: _nameController,
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 6,
              decoration: InputDecoration(
                labelText: TallyCounterLocalizations.of(context)
                    .purposeDialogDescriptionLabel,
                alignLabelWithHint: false, // true to put at the start
                border: const OutlineInputBorder(),
              ),
              controller: _descriptionController,
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            primary: Colors.red,
          ),
          child: Text(TallyCounterLocalizations.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onFormSubmit?.call(
              _nameController.value.text,
              _descriptionController.value.text,
            );
          },
          child: Text(TallyCounterLocalizations.of(context).create),
        )
      ],
    );
  }
}
