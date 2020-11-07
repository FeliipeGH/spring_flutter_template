import 'package:flutter/material.dart';

class FootPage extends StatelessWidget {
  final String copy;
  final String business;
  final String version;

  const FootPage(
      {Key key,
      @required this.copy,
      @required this.business,
      @required this.version})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Wrap(
                    children: [
                      Text(copy),
                      Text(
                        business+" ",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      Text("Todos los derechos reservados."),
                    ],
                  ),
                  //Text("Copyright © 2020 ADP. Todos los derechos reservados.")
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    version,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
