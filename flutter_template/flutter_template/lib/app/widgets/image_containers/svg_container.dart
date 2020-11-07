import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ImageWrapper extends StatelessWidget {
  final String name;
  final double height;
  final double width;

  const ImageWrapper({Key key, this.name, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: width,
        height: height,
        child: WebsafeSvg.asset(name, fit: BoxFit.contain),
      ),
    );
  }
}