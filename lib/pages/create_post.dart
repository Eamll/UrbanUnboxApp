import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePost> {
  TextEditingController _businessNameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  List<String> _attributes = [];
  String? _selectedImagePath;

  @override
  void dispose() {
    _businessNameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _addAttribute() {
    setState(() {
      _attributes.add('');
    });
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _selectedImagePath = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _selectImage,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _selectedImagePath != null
                    ? Image.file(
                        File(_selectedImagePath!),
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.add_a_photo,
                        size: 48,
                        color: Colors.grey[400],
                      ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _businessNameController,
              decoration: InputDecoration(
                labelText: 'Business Name',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Additional Attributes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _attributes.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TextFormField(
                  onChanged: (value) {
                    _attributes[index] = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Attribute ${index + 1}',
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addAttribute,
              child: Text('Add Attribute'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the post and navigate to the next screen
              },
              child: Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}
