import 'package:flutter/cupertino.dart';

class ItemModel {
  String icon;
  List<Span> spans;
  List<Color> colors;
  String logo;

  ItemModel(this.icon, this.colors, this.logo, this.spans);
}

class Span {
  String text;
  double size;
  Color color;
  Span(this.text, this.size, this.color);
}
