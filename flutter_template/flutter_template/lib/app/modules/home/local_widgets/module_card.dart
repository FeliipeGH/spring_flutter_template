import 'package:flutter/material.dart';
import 'package:flutter_template/app/modules/home/local_widgets/icon_card.dart';
import 'package:flutter_template/app/theme/typography.dart';

class ModuleCard extends StatelessWidget {
  final String tittle;
  final String subTittle;
  final String contextText;
  final IconData mainIcon;
  final IconData subIcon;
  final Color mainIconColor;
  final Color subIconColor;
  final Function onTap;

  const ModuleCard(
      {Key key,
      @required this.tittle,
      @required this.subTittle,
      @required this.contextText,
      @required this.mainIcon,
      @required this.subIcon,
      @required this.mainIconColor,
      @required this.subIconColor,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(4, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: IconCard(
                          icon: mainIcon,
                          iconColor: mainIconColor),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  tittle,
                                  style: MainTypography.subtitleTextStyle,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  subTittle,
                                  style:
                                      MainTypography.headlineSecondaryTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          subIcon,
                          color: subIconColor,
                        )),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          contextText,
                          style: MainTypography.bodyTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
