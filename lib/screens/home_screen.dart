import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trimix')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.video_library, size: 90, color: Colors.redAccent),
            SizedBox(height: 20),
            Text('Trimix Video Editor', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Tri = Video + Audio + Text', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 30),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('New Project'),
            ),
          ],
        ),
      ),
    );
  }
}
