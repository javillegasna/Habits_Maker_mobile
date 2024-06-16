import 'package:flutter/material.dart';

class SampleItemDetailsArgs {
  final int id;

  SampleItemDetailsArgs({required this.id});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
    };
  }

  static fromMap(Map map) {
    return SampleItemDetailsArgs(id: map["id"]);
  }
}

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  final int id;

  const SampleItemDetailsView({super.key, required this.id});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Text('ID: $id'),
      ),
    );
  }
}
