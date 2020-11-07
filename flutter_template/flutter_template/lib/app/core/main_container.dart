import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_template/app/core/constants/menu_constants.dart';
import 'package:flutter_template/app/core/drawer/drawer_container.dart';
import 'package:flutter_template/app/core/store/menu_provider.dart';

class MainContainer extends StatelessWidget {
  //Main content
  final Widget content;
  final bool showPopMenu;

  //Scaffold attributes
  final floatingActionButton;
  final floatingActionButtonLocation;
  final floatingActionButtonAnimator;
  final persistentFooterButtons;
  final endDrawer;
  final bottomNavigationBar;
  final bottomSheet;
  final backgroundColor;
  final resizeToAvoidBottomPadding;
  final resizeToAvoidBottomInset;
  final primary = true;
  final drawerDragStartBehavior = DragStartBehavior.start;
  final extendBody = false;
  final extendBodyBehindAppBar = false;
  final drawerScrimColor;
  final drawerEdgeDragWidth;
  final drawerEnableOpenDragGesture = true;
  final endDrawerEnableOpenDragGesture = true;
  final String title;
  final Color appBarBackgroundColor;
  final bool showSearchBar;
  final TextStyle textStyle;
  final Color iconColor;
  final int index;

  const MainContainer(
      {Key key,
      @required this.content,
      @required this.showSearchBar,
      @required this.appBarBackgroundColor,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.persistentFooterButtons,
      this.endDrawer,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.showPopMenu = true,
      this.backgroundColor,
      this.resizeToAvoidBottomPadding,
      this.resizeToAvoidBottomInset,
      this.drawerScrimColor,
      @required this.title,
      this.drawerEdgeDragWidth,
      this.textStyle,
      this.iconColor = Colors.black,
      this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: true,
        backgroundColor: backgroundColor,
        floatingActionButton:
            sizingInformation.isMobile ? floatingActionButton : null,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        drawerDragStartBehavior: drawerDragStartBehavior,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        drawerScrimColor: drawerScrimColor,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        extendBody: extendBody,
        endDrawer: endDrawer,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        floatingActionButtonLocation: floatingActionButtonLocation,
        persistentFooterButtons: persistentFooterButtons,
        primary: primary,
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? DrawerContainer().getDrawer(index: index)
            : null,
        appBar: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? AppBar(
                elevation: 2,
                backgroundColor: appBarBackgroundColor,
                title: Text(
                  title,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: iconColor,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    }),
              )
            : null,
        body: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? content
            : _MainContent(
                sizingInformation: sizingInformation,
                content: content,
                title: Text(
                  title,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                showSearchBar: showSearchBar,
                showPopUpMenu: showPopMenu,
                appBarBackgroundColor: appBarBackgroundColor,
                iconColor: iconColor,
                index: index,
              ),
      );
    });
  }
}

class _MainContent extends StatefulWidget {
  final SizingInformation sizingInformation;
  final Widget content;
  final Widget title;
  final bool showSearchBar;
  final bool showPopUpMenu;
  final Color appBarBackgroundColor;
  final Color iconColor;
  final int index;

  const _MainContent(
      {Key key,
      this.sizingInformation,
      this.content,
      this.showPopUpMenu,
      this.title,
      this.showSearchBar,
      this.appBarBackgroundColor = Colors.white,
      this.iconColor,
      this.index})
      : super(key: key);

  @override
  __MainContentState createState() => __MainContentState();
}

const String menuFirstValueKey="menuFirstValueKey";
const String menuSecondValueKey="menuSecondValueKey";

class __MainContentState extends State<_MainContent> {
  double menuWidth;


  @override
  void initState() {
    super.initState();
    MenuProvider menuProvider =
        Provider.of<MenuProvider>(context, listen: false);
    menuWidth=menuProvider.getMenuWidth;
  }

  @override
  Widget build(BuildContext context) {
    return widget.sizingInformation.isMobile
        ? widget.content
        : AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            child: MenuConstants.menuOpen == menuWidth
                ? menuWidthContainer(context)
                : littleMenuContainer(context),
          );
  }

  Widget menuContainer(double width) {
    return Container(
      width: width,
      child: DrawerContainer().getDrawer(
          showComplete: width == MenuConstants.menuOpen, index: widget.index),
    );
  }

  Widget mainContainer(BuildContext context) {
    MenuProvider menuProvider =
        Provider.of<MenuProvider>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          elevation: 2,
          backgroundColor: widget.appBarBackgroundColor,
          title: widget.title,
          leading: InkWell(
            child: Icon(
              menuProvider.getMenuWidth == MenuConstants.menuOpen
                  ? Icons.arrow_back_ios
                  : Icons.menu,
              color: widget.iconColor,
            ),
            onTap: () {
              if (MenuConstants.menuOpen == menuProvider.getMenuWidth) {
                menuWidth=menuProvider.setMenuWidth = MenuConstants.menuClose;
              } else {
                menuWidth=menuProvider.setMenuWidth = MenuConstants.menuOpen;
              }
              setState(() {});
            },
          ),
        ),
      ),
      body: widget.content,
    );
  }

  Widget menuWidthContainer(BuildContext context) {
    return Row(
      key: ValueKey(menuFirstValueKey),
      children: [
        menuContainer(MenuConstants.menuOpen),
        Flexible(child: mainContainer(context)),
      ],
    );
  }

  Widget littleMenuContainer(BuildContext context) {
    return Row(
      key: ValueKey(menuSecondValueKey),
      children: [
        menuContainer(MenuConstants.menuClose),
        Flexible(child: mainContainer(context)),
      ],
    );
  }
}

class PopMenu extends StatefulWidget {
  @override
  _PopMenuState createState() => _PopMenuState();
}

class _PopMenuState extends State<PopMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: GestureDetector(
        child: Icon(
          Icons.settings,
          color: Colors.black54,
        ),
        onTap: () {},
        onTapDown: (TapDownDetails details) {
          _showPopupMenu(details.globalPosition);
        },
      ),
    );
  }

  void _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 50, 80),
      items: [
        PopupMenuItem<String>(
          child: Container(
              child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {},
            child: Row(
              children: [
                Container(margin: EdgeInsets.all(8), child: Icon(Icons.email)),
                Container(margin: EdgeInsets.all(8), child: Text('Mensajes')),
              ],
            ),
          )),
        ),
        PopupMenuItem<String>(
          child: Container(
              child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {},
            child: Row(
              children: [
                Container(margin: EdgeInsets.all(8), child: Icon(Icons.help)),
                Container(margin: EdgeInsets.all(8), child: Text('Ayuda')),
              ],
            ),
          )),
        ),
        PopupMenuItem<String>(
          child: Container(
              child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {},
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8), child: Icon(Icons.settings)),
                Container(
                    margin: EdgeInsets.all(8), child: Text('Configuración')),
              ],
            ),
          )),
        ),
        PopupMenuItem<String>(
          child: Container(
              child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {},
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    )),
                Container(margin: EdgeInsets.all(8), child: Text('Salir')),
              ],
            ),
          )),
        ),
      ],
      elevation: 8.0,
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 260,
        child: TextField(
          decoration: InputDecoration(
            fillColor: Theme.of(context).dividerColor,
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                )),
            filled: true,
            labelText: "Buscar",
            prefixIcon: Icon(Icons.search),
          ),
        ));
  }
}

class TabletWebContent extends StatelessWidget {
  final Widget content;

  const TabletWebContent({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
/*
if (showPopUpMenu)
Positioned(
top: 8,
right: 16,
child: Container(
child: PopMenu(),
),
),*/
/*if (showSearchBar) Flexible(child: SearchBar()),*/
