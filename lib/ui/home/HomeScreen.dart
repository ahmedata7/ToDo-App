import 'package:flutter/material.dart';
import 'package:todo_app/ui/home/listTab.dart';
import 'package:todo_app/ui/home/settingsTab.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var tabs = [ListTab(),SettingsTab()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar:
      Expanded(
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          height: 90,
          child: BottomNavigationBar(
            items: [
            BottomNavigationBarItem(icon:Icon(Icons.list,size: 40),label: "" ),
            BottomNavigationBarItem(icon:Icon(Icons.settings_rounded,size: 30),label: ""),
          ],
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex:selectedIndex,),
        ),
      ),
      body: tabs[selectedIndex],
      backgroundColor: Color(0xFFDFECDB),
      floatingActionButton:
      FloatingActionButton(

        onPressed: (){},child:Icon(Icons.add,size: 30,),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,

    );
  }
}
