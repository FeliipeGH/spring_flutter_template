import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/typography.dart';

class CustomTittle extends StatelessWidget {
  final String tittle;
  final Decoration decoration;

  const CustomTittle({Key key, @required this.tittle, this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Text(
          tittle.toUpperCase(),
          style: MainTypography.headlineTextStyle.copyWith(fontSize: 22),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
