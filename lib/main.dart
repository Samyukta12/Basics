import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:ihateu/account.dart';
import 'package:ihateu/home.dart';
import 'package:ihateu/microphone.dart';
import 'package:ihateu/search.dart';
import 'package:ihateu/tickets.dart';
import 'profile.dart';
import 'Setting.dart';




void main() => runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;
  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];
List list=[ tickets(),account(),home(),microphone(),search()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: snakeBarStyle,
          snakeShape: snakeShape,
          shape: bottomBarShape,
          padding: padding,

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: selectedColor,
          selectedItemColor: snakeShape == SnakeShape.indicator ? selectedColor : null,
          unselectedItemColor: Colors.blueGrey,

          ///configuration for SnakeNavigationBar.gradient
          //snakeViewGradient: selectedGradient,
          //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
          //unselectedItemGradient: unselectedGradient,

          showUnselectedLabels: showUnselectedLabels,
          showSelectedLabels: showSelectedLabels,

          currentIndex: _selectedItemPosition,
          onTap: (index) => setState(() => _selectedItemPosition = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'tickets'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'account'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.podcasts), label: 'microphone'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
          ],
        ),

      drawer: Drawer(
          child: ListView(
          children:[
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
            },
              child: const ListTile(
                leading: Icon(Icons.perm_identity),
                title: Text('Profile'),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            GestureDetector(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
            },
              child:const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
          ],
        )
      ),




        appBar: AppBar(
          title: Text('Material'),
        ),
        body: list[_selectedItemPosition],


    );
  }
}
