import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_template/app/widgets/foot_widgets/foot_page.dart';

class ContentWidget extends StatelessWidget {
  final Widget contain;
  final ScrollController _scrollController=ScrollController();

  ContentWidget({Key key, this.contain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                            child:contain
                        ),
                        if (kIsWeb) FootPage(
                          copy: "Copyright © 2020 ",
                          business: "ADP.",
                          version: "Version 1.0.0",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
