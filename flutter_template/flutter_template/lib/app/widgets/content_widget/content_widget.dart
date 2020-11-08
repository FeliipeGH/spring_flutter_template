import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_template/app/widgets/foot_widgets/foot_page.dart';

class ContentWidget extends StatelessWidget {
  final Widget contain;

  ContentWidget({Key key, this.contain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return Container(
      height: height,
      child: Column(
        children: [
          Expanded(
            child: Container(
              //height: height*0.85,
              child: contain
            ),
          ),
          if (kIsWeb) Container(
            //height: height*0.05,
            child: FootPage(
              copy: "Copyright © 2020 ",
              business: "ADP.",
              version: "Version 1.0.0",
            ),
          ),
        ],
      )
    );
  }
}
