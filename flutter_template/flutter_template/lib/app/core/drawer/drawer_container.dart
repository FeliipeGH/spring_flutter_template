import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'item_model.dart';

class DrawerContainer {
  List<ItemModel> _listElement;
  Color _color = Colors.red;
  Color _bgColor = Colors.white;
  ListTile _title;
  ListTile _profile;
  String _stringProfile;

  TextStyle _textStyle = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w300));


  static final DrawerContainer _singleton = new DrawerContainer._internal();

  factory DrawerContainer() {
    return _singleton;
  }

  DrawerContainer._internal();

  void setListElements({List<ItemModel> listElement}) {
    _listElement = listElement;
  }

  void setSelectedColor({Color selectedColor}) {
    _color = selectedColor;
  }

  void setBackgroundColor({Color bgColor}) {
    _bgColor = bgColor;
  }

  void setTitle({ListTile title}) {
    _title = title;
  }

  void setProfile({ListTile profile}) {
    _profile = profile;
  }

  void setStringProfile({String profile}) {
    _stringProfile = profile;
  }

  void setStyle(TextStyle textStyle) {
    _textStyle = textStyle;
  }

  Widget getDrawer({bool showComplete = true, int index = 0}) {
    //drawerController.setIndexWithoutUpdate(index);
    index = index + 2;
    if (_listElement == null) {
      throw new Exception("Drawer has not elements to draw");
    }
    return BuildDrawer(
      listElement: _listElement,
      color: _color,
      textStyle: _textStyle,
      showComplete: showComplete,
      title: _title,
      profile: _profile,
      stringProfile: _stringProfile,
      bgColor: _bgColor,
      selectedIndex: index,
    );
  }
}

class BuildDrawer extends StatelessWidget {
  final List<ItemModel> listElement;
  final Color color;
  final TextStyle textStyle;
  final bool showComplete;
  final ListTile title;
  final ListTile profile;
  final String stringProfile;
  final Color bgColor;
  final int selectedIndex;

  const BuildDrawer({
    Key key,
    this.listElement,
    this.color,
    this.textStyle,
    this.showComplete,
    this.title,
    this.profile,
    this.stringProfile,
    this.bgColor,
    this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        color: bgColor,
        child: Scrollbar(
          child: ListView.builder(
              itemCount: listElement.length + 2,
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? showComplete
                        ? Column(
                            children: [
                              InkWell(
                                onTap: title.onTap,
                                child: Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 16),
                                    child: Row(
                                      children: [
                                        Flexible(
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: title.leading)),
                                        Flexible(child: title.title),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 14),
                                width: double.infinity,
                                color: Colors.black26,
                                height: 1,
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                      child: Center(
                                          child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 24),
                                              child: title.leading))),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 14),
                                width: double.infinity,
                                color: Colors.black26,
                                height: 1,
                              )
                            ],
                          )
                    : index == 1
                        ? showComplete
                            ? Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      profile.onTap();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 2),
                                      color: selectedIndex==
                                              index
                                          ? color
                                          : Colors.transparent,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 16),
                                        child: Row(
                                          children: [
                                            Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 24),
                                                    child: profile.leading)),
                                            Flexible(
                                                child: Text(
                                              stringProfile,
                                              style: TextStyle(
                                                  color: selectedIndex==
                                                          index
                                                      ? Colors.white
                                                      : Colors.black),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    width: double.infinity,
                                    color: Colors.black26,
                                    height: 1,
                                  )
                                ],
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                            child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 2),
                                          color:selectedIndex ==
                                                  index
                                              ? color
                                              : Colors.transparent,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 2),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 24),
                                            child: InkWell(
                                              child: profile.leading,
                                              onTap: () {
                                                profile.onTap();
                                              },
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      width: double.infinity,
                                      color: Colors.black26,
                                      height: 1,
                                    )
                                  ],
                                ),
                              )
                        : Container(
                            color:
                                selectedIndex == index
                                    ? color
                                    : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                listElement[index - 2].onTap();
                              },
                              title: showComplete
                                  ? Text(
                                      listElement[index - 2].title,
                                      style: selectedIndex ==
                                              index
                                          ? textStyle.copyWith(
                                              color: Colors.white)
                                          : textStyle,
                                    )
                                  : null,
                              leading: Container(
                                width: 30,
                                child: Icon(
                                  listElement[index - 2].leading,
                                  color:
                                      selectedIndex==
                                              index
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          );
              }),
        ),
      ),
    );
  }
}
