import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomAlertDialog extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String titleText;
  final TextStyle titleStyle;
  final String messageText;
  final TextStyle messageStyle;
  final List<Widget> listActions;

  const CustomAlertDialog(
      {Key key,
      this.icon,
      this.iconColor,
      this.titleText,
      this.titleStyle,
      this.messageText,
      this.messageStyle,
      this.listActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MobileDialog(
            messageText: messageText,
            messageStyle: messageStyle,
            listActions: listActions,
            icon: icon,
            titleText: titleText,
            titleStyle: titleStyle,
            iconColor: iconColor,
            context: context,
          );
        } else {
          return WebTabletDialog(
            context: context,
            titleStyle: titleStyle,
            titleText: titleText,
            icon: icon,
            listActions: listActions,
            messageStyle: messageStyle,
            iconColor: iconColor,
            messageText: messageText,
          );
        }
      },
    );
  }
}

class WebTabletDialog extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final String titleText;
  final TextStyle titleStyle;
  final String messageText;
  final Color iconColor;
  final TextStyle messageStyle;
  final List<Widget> listActions;

  WebTabletDialog(
      {@required this.context,
      @required this.messageStyle,
      @required this.listActions,
      @required this.titleText,
      @required this.messageText,
      @required this.titleStyle,
      @required this.icon,
      @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        height: 220,
        child: Container(
          child: Column(
            children: [
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 110,
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(titleText, style: titleStyle),
                  )),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  messageText,
                  style: messageStyle,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
      actions: listActions,
    );
  }
}

class MobileDialog extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final String titleText;
  final TextStyle titleStyle;
  final String messageText;
  final Color iconColor;
  final TextStyle messageStyle;
  final List<Widget> listActions;

  MobileDialog(
      {@required this.context,
      @required this.messageStyle,
      @required this.listActions,
      @required this.titleText,
      @required this.messageText,
      @required this.titleStyle,
      @required this.icon,
      @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
      title: TitleAlert(
        iconColor: iconColor,
        titleStyle: titleStyle,
        titleText: titleText,
        icon: icon,
      ),
      content: Text(
        messageText,
        style: messageStyle.copyWith(fontSize: 12),
        overflow: TextOverflow.ellipsis,
      ),
      actions: listActions,
    );
  }
}

class TitleAlert extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final String titleText;
  final TextStyle titleStyle;

  const TitleAlert(
      {Key key, this.iconColor, this.icon, this.titleText, this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                icon,
                color: iconColor,
              ),
            )),
        Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                titleText,
                style: titleStyle.copyWith(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ],
    );
  }
}
