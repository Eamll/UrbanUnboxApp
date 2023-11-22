import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController _businessNameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  List<String> _attributes = [];

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
    );
  }
}
