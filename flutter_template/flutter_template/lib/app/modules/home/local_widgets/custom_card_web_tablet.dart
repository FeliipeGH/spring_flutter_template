import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/typography.dart';

class CustomCardTabletWeb extends StatelessWidget {
  final String cardTitle;
  final IconData icon;
  final Color iconBgColor;
  final String mainText;
  final String subText;
  final Color iconColor;
  final Function onTap;

  const CustomCardTabletWeb({Key key,
    @required this.cardTitle,
    @required this.icon,
    @required this.iconBgColor,
    @required this.mainText,
    @required this.subText,
    @required this.iconColor,
    @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 310,
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              child: CardContainer(
                cardTitle: cardTitle,
                mainText: mainText,
                subText: subText,
              ),
            ),
            Positioned(
              left: 10,
              child: IconCardCustom(
                  icon: icon, iconColor: iconColor, iconBgColor: iconBgColor),
            )
          ],
        ),
      ),
    );
  }
}

class IconCardCustom extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const IconCardCustom({Key key,
    @required this.icon,
    @required this.iconColor,
    @required this.iconBgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 80,
      child: Card(
        elevation: 5,
        color: iconBgColor,
        child: Icon(
          icon,
          color: iconColor,
          size: 40,
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final String subText;
  final String mainText;
  final String cardTitle;

  const CardContainer({Key key,
    @required this.subText,
    @required this.mainText,
    @required this.cardTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 180,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          cardTitle,
                          style: MainTypography.headlineSecondaryTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Divider(),
              Align(
                  alignment: Alignment.topLeft,
                  child: FittedBox(
                    child: Text(
                      subText,
                      style: MainTypography.bodyTextStyle.copyWith(
                          color: Colors.grey),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
