import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetExample extends StatefulWidget {
  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  File? _image;

  Future<void> _openImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }

    Navigator.of(context).pop(); // Close the bottom sheet
  }

  void _submitImage() {
    // TODO: Implement your submit logic here
    if (_image != null) {
      // Do something with the selected image
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text('Select from gallery'),
          onTap: () => _openImagePicker(context),
        ),
        if (_image != null) ...[
          Container(
            padding: const EdgeInsets.all(16),
            child: Image.file(_image!),
          ),
          ElevatedButton(
            onPressed: _submitImage,
            child: const Text('Submit'),
          ),
        ],
        const Divider(),
        ListTile(
          leading: const Icon(Icons.cancel),
          title: const Text('Cancel'),
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
