import 'package:flutter/material.dart';

class CustomAlertFlatButton extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final Function onPressed;
  final Color bgColor;

  const CustomAlertFlatButton(
      {Key key,
        @required this.title,
        @required this.onPressed,
        @required this.titleStyle,
        @required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return FlatButton(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(width<600?4:16.0),
        child: Text(title,style: titleStyle,),
      ),
    );
  }
}
