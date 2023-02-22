import 'package:flutter/material.dart';

enum AddMemberState { none, running, stopped }

class AddMemberPage extends StatefulWidget {
  AddMemberState state = AddMemberState.none;
  AddMemberPage({required int stateIndex}) {
    state = AddMemberState.values[stateIndex];
  }

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Source group",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Source group",
                ),
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Target group",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Target group",
                ),
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              "State",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(child: SizedBox(width: double.infinity)),
            getState(widget.state),
            SizedBox(width: 30),
          ],
        ),
        SizedBox(height: 30),
        getButton(widget.state),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget getState(AddMemberState state) {
    switch (state) {
      case AddMemberState.none:
        return Text(
          "Unknown",
          style: TextStyle(fontSize: 20),
        );
      case AddMemberState.running:
        return Text(
          "Running",
          style: TextStyle(fontSize: 20),
        );
      case AddMemberState.stopped:
        return Text(
          "Stopped",
          style: TextStyle(fontSize: 20),
        );
      default:
        return Text(
          "Unknown",
          style: TextStyle(fontSize: 20),
        );
    }
  }

  Widget getButton(AddMemberState state) {
    switch (state) {
      case AddMemberState.none:
        return TextButton(onPressed: () {}, child: Text("Unknown"));
      case AddMemberState.running:
        return TextButton(
            onPressed: () {
              setState(() {
                widget.state = AddMemberState.stopped;
              });
            },
            child: Text("Stop"));
      case AddMemberState.stopped:
        return TextButton(
            onPressed: () {
              setState(() {
                widget.state = AddMemberState.running;
              });
            },
            child: Text("Start"));
      default:
        return TextButton(onPressed: () {}, child: Text("Unknown"));
    }
  }
}
