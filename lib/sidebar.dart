import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SideBar extends StatelessWidget {
  Function(int) changePage = (index) {};
  SideBar(Function(int) changePage) {
    this.changePage = changePage;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          buildItem("Accounts", 0),
          buildItem("Add Members", 1),
        ],
      ),
      height: height,
      color: Colors.blueGrey,
    );
  }

  Widget buildItem(String name, int index) {
    return Material(
      child: InkWell(
        onTap: () {
          changePage(index);
        },
        child: Container(
          child: Text(
            name,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(16),
        ),
      ),
      color: Colors.blueGrey,
    );
  }
}
