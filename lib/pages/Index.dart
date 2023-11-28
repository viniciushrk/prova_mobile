import 'package:flutter/material.dart';
import 'package:prova_mobile/pages/Money.dart';
import 'package:prova_mobile/pages/Weather.dart';

import 'TodoList.dart';

class Index extends StatefulWidget{
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index>  {
  int _currentIndex = 0;
  String pesquisa = "";

  List _pages = [
    Weather(),
    Money(),
    TodoList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (_index){
            setState(() {
              _currentIndex = _index;
            });
          },
          // ou shifting
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.red,
                label: "Clima",
                icon: Icon(Icons.cloud)
            ),
            BottomNavigationBarItem(
                label: "Moeda",
                icon: Icon(Icons.money)
            ),
            BottomNavigationBarItem(
                label: "To-do",
                icon: Icon(Icons.list)
            )
          ]
      ),
    );
  }
}