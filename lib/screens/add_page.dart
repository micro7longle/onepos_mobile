import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:http/http.dart' as http;

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Category Name"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: "Description"),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 6,
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: submitData, child: Text('Submit'))
        ],
      ),
    );
  }

  Future<void> submitData() async {
    // Get the data from form
    final name = nameController.text;
    final description = descriptionController.text;

    final body = {
      "title": name,
      "description": description,
      "is_completed": false
    };

    // Submit data to the service
    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);

    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    // Show success or fail message based on status
    print(response.statusCode);

    if (response.statusCode == 201) {
      // Set cho 2 field rong
      nameController.text = '';
      descriptionController.text = '';

      print('Creation Success');
      print(response.body);

      showSuccessMessage("Creation Success");
    } else {
      print('Creation Failed');
      print(response.body);

      showErrorMessage('Creation Failed');
    }
  }

  // Hien len thong bao thanh cong
  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Hien len thong bao that bai
  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
