

import 'package:flutter/material.dart';
import 'package:tugas_akhir/filter.dart';
import 'package:tugas_akhir/profile.dart';
import 'package:tugas_akhir/search.dart';

import 'home.dart';



void main() async {
  runApp(const MyApp(
    
  ));
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
  

}
class MainApp extends StatefulWidget {
  
  const MainApp({ Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
  
}

class _MainAppState extends State<MainApp> {
  int _selectedNavbar = 0;
  
  final screens = [
    HomePage(),
    SearchPage( ),
    ProfilePage()
   
  ]; 
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[_selectedNavbar]) ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30, ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: ""
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedNavbar,
        onTap: (index) => setState(() => _selectedNavbar = index),
      ),
    );
  }
}
