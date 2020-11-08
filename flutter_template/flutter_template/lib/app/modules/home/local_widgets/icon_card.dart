import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double parentHeight;

  const IconCard(
      {Key key,
      @required this.icon,
      @required this.iconColor,
      this.parentHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 90,
        maxHeight: 120.0,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            child: Icon(
              icon,
              color: iconColor,
              size: constraints.maxHeight * 0.55,
            ),
          );
        },
      ),
    );
  }
}
