import 'package:flutter/material.dart';
import 'package:flutter_template/app/modules/home/local_widgets/custom_card_mobile.dart';
import 'package:flutter_template/app/modules/home/local_widgets/custom_card_web_tablet.dart';

class CustomCard extends StatelessWidget {
  final bool isMobile;
  final String cardTitle;
  final IconData icon;
  final Color iconBgColor;
  final String mainText;
  final String subText;
  final Color iconColor;
  final Function onTap;

  const CustomCard(
      {Key key,
      @required this.isMobile,
      this.cardTitle,
      this.icon,
      this.iconBgColor,
      this.mainText,
      this.subText,
      this.iconColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? CustomCardMobile(
            iconBgColor: iconBgColor,
            cardTitle: cardTitle,
            icon: icon,
            subText: subText,
            mainText: mainText,
            iconColor: iconColor,
            onTap: onTap,
          )
        : CustomCardTabletWeb(
            iconBgColor: iconBgColor,
            cardTitle: cardTitle,
            icon: icon,
            subText: subText,
            mainText: mainText,
            iconColor: Colors.white,
            onTap: onTap,
          );
  }
}
