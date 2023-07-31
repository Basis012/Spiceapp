import 'package:flutter/material.dart';
import 'package:qbsecommerceapp/Screens/CartItems.dart';

import '../DatabaseHelper.dart';
class DataListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DatabaseHelper.instance.getAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              // Customize the appearance of each list item as needed
              return const CartItems();
            },
          );
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return Text('No data found.')
        ;
      },
    );
  }
}
