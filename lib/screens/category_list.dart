import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:onepos_mobile/screens/add_page.dart';

import '../widgets/list_item.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('This will be logged to the console in the browser.');

    return Scaffold(
      appBar: AppBar(
        title: Text('Category List'),
      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: ListItem(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddCategory,
        label: Text("Add Category"),
      ),
    );
  }

  void navigateToAddCategory() {
    final route = MaterialPageRoute(
      builder: (context) => AddCategoryPage(),
    );

    Navigator.push(context, route);
  }
}
