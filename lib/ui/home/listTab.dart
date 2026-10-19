import 'package:flutter/material.dart';
import 'package:todo_app/ui/home/listItem.dart';

class ListTab extends StatelessWidget{
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) {
      return Listitems();
    }, separatorBuilder: (context, index) {
   return Container(
     height: 20,
   );
    }, itemCount: 1);
  }
}
