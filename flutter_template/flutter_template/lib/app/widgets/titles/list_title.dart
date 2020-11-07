import 'package:flutter/material.dart';
import 'package:flutter_template/app/widgets/buttons/add_button.dart';
import 'package:flutter_template/app/widgets/titles/custom_tittle.dart';

class ListTitle extends StatelessWidget {
  final bool isMobile;
  final Function onAddButton;
  final String tittle;
  final Color bgColor;
  final String buttonTittle;

  const ListTitle(
      {Key key,
        this.isMobile,
        this.onAddButton,
        this.tittle,
        this.bgColor,
        this.buttonTittle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTittle(
            tittle: tittle,
          ),
        ),
        if (!isMobile)
          Flexible(
              child: Align(
                alignment: Alignment.topRight,
                child: CustomAddButton(
                  onPressed: onAddButton,
                  bgColor: bgColor,
                  title: buttonTittle,
                ),
              ))
      ],
    );
  }
}