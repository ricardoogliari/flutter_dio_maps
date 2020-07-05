import 'package:flutter/material.dart';
import 'package:flutterdiomaps/model/listPositions.dart';
import 'package:flutterdiomaps/model/position.dart';
import 'package:flutterdiomaps/service/endpoints.dart';
import 'package:flutterdiomaps/widgets/listItem.dart';

class ListTrucks extends StatefulWidget {
  @override
  _ListTrucksState createState() => _ListTrucksState();
}

class _ListTrucksState extends State<ListTrucks> {

  ListPositions listPositions;

  @override
  void initState() {
    super.initState();

    getPositions().then((c) {
      setState(() {
        listPositions = c;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veículos"),
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              Navigator.pushNamed(context, "/mapa", arguments: listPositions);
            },
          ),
        ],
      ),
      body: listPositions == null || listPositions.positions.length == 0 ?
      LinearProgressIndicator() : ListView.separated(
            itemBuilder: (context, index) => buildListItem(listPositions.positions[index]),
            separatorBuilder: (context, index) => Divider(height: 1),
            itemCount: listPositions.positions.length
        ),
    );
  }

  Widget buildListItem(Position position){
    return ListItemVehicle(position);
  }

}
