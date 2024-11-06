import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});
  
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen>{
  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget active_page = const CategoriesScreen();

    if(_selectedPageIndex == 1){}

    return Scaffold(
      appBar: AppBar(
        title: const Text('dynamic....'),
      ),
      body: ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favouries'),
        ],
      ),
    );
  }
}