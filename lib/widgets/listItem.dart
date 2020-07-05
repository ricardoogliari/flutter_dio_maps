import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterdiomaps/model/position.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;

class ListItemVehicle extends StatefulWidget {
  final Position position;

  ListItemVehicle(this.position);

  @override
  _ListItemVehicleState createState() => _ListItemVehicleState();
}

class _ListItemVehicleState extends State<ListItemVehicle> {

  TextStyle style15dp = TextStyle(
    fontSize: 15,
  );

  TextStyle style27dp = TextStyle(fontSize: 27);

  Geolocator.Placemark placemark;

  @override
  void initState() {
    super.initState();
    getAddress();
  }

  getAddress() async {
    List<Geolocator.Placemark> listPlacemarks = await Geolocator.Geolocator().placemarkFromCoordinates(
        widget.position.lat, widget.position.lng);

    setState(() {
      placemark = listPlacemarks[0];
    });
  }

  String getFormattedAddress(){
    return "${placemark.subAdministrativeArea}, ${placemark.administrativeArea}";
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        widget.position.veiculo_placa.trim(),
                        style: style27dp
                    ),
                    Row(
                      children: [
                        Expanded(child:
                        Text(
                            widget.position.condutor_nome == null ? "-" : widget.position.condutor_nome,
                            style: style15dp
                        )
                        ),
                        Text(
                            widget.position.data,
                            style: style15dp
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child:
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            placemark == null ?
                            "Buscando endereço..." : getFormattedAddress(),
                            style: style15dp,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                        ),
                        Text(
                            "${widget.position.velocidade}km/h",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
        onTap: (){
          Navigator.pushNamed(context, "/mapa", arguments: widget.position);
        },
      ),
      actions: <Widget>[],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Comandos',
          color: Colors.lightBlue,
          foregroundColor: Colors.white,
          icon: Icons.archive,
          onTap: () {},
        ),
      ],
    );
  }


}
