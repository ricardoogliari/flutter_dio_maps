
import 'package:flutterdiomaps/model/position.dart';

class ListPositions {

  List<Position> positions;

  ListPositions({
    this.positions
  });

  ListPositions.fromJson(Map<String, dynamic> json)
      : positions = json['data'] == null ? null : buildListPositions(json['data']);

  static List<Position> buildListPositions(List<dynamic> list) => list.map((item) => Position.fromJson(item)).toList();

}