import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final String title;
  final List<String> items;
  final VoidCallback onAdd;

  const ListPage({
    super.key,
    required this.title,
    required this.items,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add),
                label: const Text("Add"),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: items.isEmpty
                ? const Center(child: Text("No items found"))
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) =>
                        Card(child: ListTile(title: Text(items[index]))),
                  ),
          ),
        ],
      ),
    );
  }
}
