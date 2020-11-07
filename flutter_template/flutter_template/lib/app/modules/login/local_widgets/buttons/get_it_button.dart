import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/typography.dart';

class GetIt extends StatelessWidget {
  final IconData icon;
  final String title;

  const GetIt({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.all(8),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Flexible(
                child: Text(
                  title,
                  style: MainTypography.buttonTextStyle
                      .copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        color: Colors.black,
      ),
    );
  }
}