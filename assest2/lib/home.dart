import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const Center(child: Text('Selamat Datang!')),
    const Center(child: Text('Ini page product')),
    const Center(child: Text('Ini page contact')),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          bottom: TabBar(
            onTap: _onTabTapped,
            tabs: const [
              Tab(text: 'Home'),
              Tab(text: 'Product'),
              Tab(text: 'Contact'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child:
                    const Text('Menu', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  _onTabTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Product'),
                onTap: () {
                  _onTabTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Contact'),
                onTap: () {
                  _onTabTapped(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}
