import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/typography.dart';

class CustomCardMobile extends StatelessWidget {
  final String cardTitle;
  final IconData icon;
  final Color iconBgColor;
  final String mainText;
  final String subText;
  final Color iconColor;
  final Function onTap;

  const CustomCardMobile(
      {Key key,
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
      width: 200,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Expanded(
                child: IconCardCustom(
                    icon: icon, iconColor: iconColor, iconBgColor: iconBgColor),
              ),
              Expanded(
                child: CardContainer(
                  cardTitle: cardTitle,
                  mainText: mainText,
                  subText: subText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconCardCustom extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const IconCardCustom(
      {Key key,
      @required this.icon,
      @required this.iconColor,
      @required this.iconBgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 5,
        color: iconBgColor,
        child: Icon(
          icon,
          color: iconColor,
          size: 60,
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final String subText;
  final String mainText;
  final String cardTitle;

  const CardContainer(
      {Key key,
      @required this.subText,
      @required this.mainText,
      @required this.cardTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardTitle,
                  style: MainTypography.headlineSecondaryTextStyle,
                ),
                Text(
                  mainText,
                  style: MainTypography.headlineSecondaryTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Spacer(),
            Divider(),
            Align(
                alignment: Alignment.topLeft,
                child: FittedBox(
                  child: Text(
                    subText,
                    style: MainTypography.bodyTextStyle
                        .copyWith(color: Colors.grey),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
