import 'package:flutter/material.dart';

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
      title: const Text('New Purpose'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLength: 36,
              decoration: const InputDecoration(
                labelText: 'Name',
                counterText: '',
              ),
              controller: _nameController,
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Description',
                alignLabelWithHint: false, // true to put at the start
                border: OutlineInputBorder(),
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
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onFormSubmit?.call(
              _nameController.value.text,
              _descriptionController.value.text,
            );
          },
          child: const Text('Create'),
        )
      ],
    );
  }
}
