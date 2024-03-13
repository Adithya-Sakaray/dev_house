import 'package:flutter/material.dart';

class MyCardList extends StatelessWidget {
  final List<String> items;

  const MyCardList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2, // Adjust the elevation as needed
            child: ListTile(
              title: Text(items[index]),
              subtitle: const Text('Subtitle'),
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              onTap: () {
                // Handle onTap event
              },
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Card List Example'),
      ),
      body: MyCardList(
        items: List.generate(20, (index) => 'Item ${index + 1}'),
      ),
    ),
  ));
}
