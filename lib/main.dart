import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/editor_screen.dart';

void main() {
  runApp(TrimixApp());
}

class TrimixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trimix',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF121212),
        cardColor: Color(0xFF1E1E1E),
        useMaterial3: true,
        colorScheme: ColorScheme.dark(primary: Colors.redAccent),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1; // Editor tab default khule

  final List<Widget> _screens = [
    HomeScreen(),
    EditorScreen(),
    Center(child: Text('Export - Phase 3')),
    Center(child: Text('Settings - Phase 4')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.movie_edit_outlined), selectedIcon: Icon(Icons.movie_edit), label: 'Editor'),
          NavigationDestination(icon: Icon(Icons.ios_share_outlined), selectedIcon: Icon(Icons.ios_share), label: 'Export'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
