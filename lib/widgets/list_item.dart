import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => ListItemState();
}

class ListItemState extends State<ListItem> {
  List items = [];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: fetchCategory,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index] as Map;
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(item['title']),
              subtitle: Text(item['description']),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  if (value == 'edit') {
                    // Open Edit Page
                  } else if (value == 'delete') {
                    // Delete and remove the item
                  }
                },
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ];
                },
              ),
            );
          },
        ));
  }

  Future<void> fetchCategory() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    // print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;

      setState(() {
        items = result;
      });
    } else {
      // Show error
    }
  }
}
