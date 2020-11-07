import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAddButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color bgColor;

  const CustomAddButton(
      {Key key,
      @required this.onPressed,
      @required this.title,
      @required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
            ),
          )),
          Flexible(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style:
                  MainTypography.buttonTextStyle.copyWith(color: Colors.white),
            ),
          )),
        ],
      ),
    );
  }
}
