import 'package:flutter/material.dart';

void showUpdateDialog({
  required BuildContext context,
  required String desc,
  required Function(String) onSave,
}) {
  final _descController = TextEditingController();
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Update $desc'),
      content: Padding(
        padding: EdgeInsets.all(8),
        child: TextField(
          controller: _descController,
          decoration: InputDecoration(
            hintText: 'Enter New $desc',
            filled: true,
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('Cancel')),
        ElevatedButton(onPressed: () {
          if(_descController.text.isEmpty)return;
          final value = _descController.text;
          onSave(value);
          Navigator.pop(context);
        }, child: Text('Update'))
      ],
    ),
  );
}


void showDeleteDialog({
  required BuildContext context,
  required Function(bool) onDelete
}){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Are you Sure'),
      content: Padding(
        padding: EdgeInsets.all(8),
      ),
      actions: [
        TextButton(onPressed: () {
          bool value = false;
          onDelete(value);
          Navigator.pop(context);
        }, child: Text('Cancel')),
        ElevatedButton(onPressed: () {
          bool value = true;
          onDelete(value);
          Navigator.pop(context);
        }, child: Text('Delete'))
      ],
    ),
  );
}
