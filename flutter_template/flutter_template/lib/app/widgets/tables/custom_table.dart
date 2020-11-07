import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/data/models/example/example_model.dart';
import 'package:flutter_template/app/theme/colors.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/decorations/table_decoration.dart';
import 'package:flutter_template/app/widgets/dialogs/delete_dialog.dart';
import 'package:flutter_template/app/widgets/inputs/search_input.dart';
import 'package:flutter_template/app/widgets/separators/separator_profile.dart';
import 'package:flutter_template/app/widgets/shapes/actions_shape_buttons.dart';
import 'package:flutter_template/app/widgets/tables/model/custom_comparable.dart';
import 'package:flutter_template/app/widgets/tables/model/fixable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomTable extends StatelessWidget {
  final bool isMobile;
  final List<Fixable> dataList;
  final String tableTitle;
  final Color iconBgColor;
  final bool allowEdit;
  final bool allowDelete;
  final String editPage;
  final Function(int id) onDelete;
  final Widget widgetIconMobile;

  const CustomTable(
      {Key key,
        @required this.isMobile,
        @required this.dataList,
        this.tableTitle = "Lista de elementos",
        this.iconBgColor = Colors.red,
        this.allowEdit = false,
        this.allowDelete = false,
        this.editPage,
        this.onDelete,
        this.widgetIconMobile = const Icon(Icons.image)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dataList.isEmpty
        ? NoContent(
      isMobile: isMobile,
      iconBgColor: iconBgColor,
    )
        : isMobile
        ? _MobileContainer(
      dataList: dataList,
      iconBgColor: iconBgColor,
      tableTitle: tableTitle,
      allowDelete: allowDelete,
      allowEdit: allowEdit,
      onDelete: onDelete,
      editPage: editPage,
      actionsFlex: dataList[0].getActionsFlex(),
      tittleList: dataList[0].getTitleFix(),
      widgetIconMobile: widgetIconMobile,
    )
        : _WebContainer(
      dataList: dataList,
      iconBgColor: iconBgColor,
      tableTitle: tableTitle,
      allowDelete: allowDelete,
      allowEdit: allowEdit,
      onDelete: onDelete,
      editPage: editPage,
      actionsFlex: dataList[0].getActionsFlex(),
      tittleList: dataList[0].getTitleFix(),
    );
  }
}

class _WebContainer extends StatefulWidget {
  final List<Fixable> dataList;
  final String tableTitle;
  final Color iconBgColor;
  final bool allowEdit;
  final bool allowDelete;
  final String editPage;
  final Function(int id) onDelete;
  final int actionsFlex;
  final List<Widget> tittleList;

  _WebContainer(
      {Key key,
        this.dataList,
        this.tableTitle,
        this.iconBgColor,
        this.allowEdit,
        this.allowDelete,
        this.editPage,
        this.onDelete,
        this.actionsFlex,
        this.tittleList})
      : super(key: key);

  @override
  __WebContainerState createState() => __WebContainerState();
}

class __WebContainerState extends State<_WebContainer> {
  final ScrollController _scrollController = ScrollController();
  List<Fixable> listToDisplay;

  @override
  void initState() {
    listToDisplay = [...widget.dataList];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double completeHeight = (size.height * (3 / 5)) + size.height * (1 / 6)-20;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: double.infinity,
          height: completeHeight,
          decoration: tableDecoration,
          child: Container(
            margin: EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 63,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Text(
                                widget.tableTitle,
                                style: MainTypography.headlineSecondaryTextStyle,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: SearchInput(
                                onChange: (String text) {
                                  setState(() {
                                    listToDisplay = widget.dataList
                                        .where((element) =>
                                        ((element as CustomComparable))
                                            .compareOn(text))
                                        .toList();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  margin: EdgeInsets.only(top: 20),
                  child: TableTitleWeb(
                    tittleList: widget.tittleList,
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    controller: _scrollController,
                    child: Container(
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: listToDisplay.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<Widget> elements = [
                              Expanded(
                                  child: Text("${index + 1}",
                                      style: MainTypography.bodyTextStyle)),
                              ...listToDisplay[index].getBodyFix(),
                              Expanded(
                                child: RowActions(
                                  allowEdit: widget.allowEdit,
                                  allowDelete: widget.allowDelete,
                                  editPage: widget.editPage,
                                  onDelete: widget.onDelete,
                                  id: listToDisplay[index].getId(),
                                ),
                                flex: widget.actionsFlex,
                              )
                            ];
                            return Column(
                              children: [
                                SeparatorProfile(),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    children: elements,
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 0,
          child: Container(
            width: 63,
            height: 65,
            decoration: getTableIconCardDecoration(widget.iconBgColor),
            child: Icon(
              FontAwesomeIcons.clipboardList,
              color: Colors.white,
              size: 38,
            ),
          ),
        ),
      ],
    );
  }
}

class RowActions extends StatelessWidget {
  final bool allowEdit;
  final bool allowDelete;
  final String editPage;
  final Function(int id) onDelete;
  final int id;
  final MainAxisAlignment alignment;

  const RowActions(
      {Key key,
        this.allowEdit,
        this.allowDelete,
        this.editPage,
        this.onDelete,
        this.id,
        this.alignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          if (allowEdit)
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  shape: actionBorderShape,
                  color: MainColors.saveButton,
                  onPressed: () {
                    Get.offNamed(editPage, arguments: id);
                    /*Get.off(editPage,
                        transition: Transition.noTransition,
                        arguments: productModel);*/
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              FontAwesomeIcons.solidEdit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              "Editar",
                              overflow: TextOverflow.ellipsis,
                              style:
                              MainTypography.bodyTextStyle.copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (allowDelete)
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  shape: actionBorderShape,
                  color: MainColors.deleteButton,
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return DeleteDialog(
                            title: "Advertencia",
                            message:
                            "Al eliminar el registro no podrá recuperarlo posteriormente",
                            onDelete: () => onDelete(id),
                          );
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              FontAwesomeIcons.trash,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              "Eliminar",
                              overflow: TextOverflow.ellipsis,
                              style:
                              MainTypography.bodyTextStyle.copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class TableTitleWeb extends StatelessWidget {
  final List<Widget> tittleList;

  const TableTitleWeb({
    Key key,
    this.tittleList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tittleList,
    );
  }
}

class _MobileContainer extends StatefulWidget {
  final List<Fixable> dataList;
  final String tableTitle;
  final Color iconBgColor;
  final bool allowEdit;
  final bool allowDelete;
  final String editPage;
  final Function(int id) onDelete;
  final int actionsFlex;
  final List<Widget> tittleList;
  final Widget widgetIconMobile;

  _MobileContainer(
      {Key key,
        this.dataList,
        this.tableTitle,
        this.iconBgColor,
        this.allowEdit,
        this.allowDelete,
        this.editPage,
        this.onDelete,
        this.actionsFlex,
        this.tittleList,
        this.widgetIconMobile})
      : super(key: key);

  @override
  __MobileContainerState createState() => __MobileContainerState();
}

class __MobileContainerState extends State<_MobileContainer> {
  List<Fixable> listToDisplay;

  @override
  void initState() {
    listToDisplay = [...widget.dataList];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double completeHeight = (size.height * (3 / 5)) + size.height * (2 / 6);
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        width: double.infinity,
        height: completeHeight,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: SearchInput(
                      onChange: (String text) {
                        setState(() {
                          listToDisplay = widget.dataList
                              .where((element) =>
                              ((element as CustomComparable))
                                  .compareOn(text))
                              .toList();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Scrollbar(
                  child: ListView.builder(
                      itemCount: listToDisplay.length,
                      itemBuilder: (BuildContext context, int index) {
                        List<Widget> columnList = [
                          ...listToDisplay[index].getBodyToMobile()
                        ];
                        columnList.add(Container(
                          margin: EdgeInsets.all(8),
                          child: RowActions(
                            allowEdit: widget.allowEdit,
                            allowDelete: widget.allowDelete,
                            editPage: widget.editPage,
                            onDelete: widget.onDelete,
                            id: listToDisplay[index].getId(),
                            alignment: MainAxisAlignment.end,
                          ),
                        ));
                        return Container(
                          decoration: getTableIconCardDecoration(Colors.white),
                          margin: EdgeInsets.symmetric(vertical: 8),
                          width: double.infinity,
                          child: ListTile(
                            leading: widget.widgetIconMobile,
                            title: Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: columnList,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NoContent extends StatelessWidget {
  final bool isMobile;
  final Color iconBgColor;

  const NoContent({Key key, this.isMobile, this.iconBgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          decoration: tableDecoration,
          width: double.infinity,
          height: isMobile
              ? size.height
              : (size.height * (3 / 5)) + size.height * (1 / 6)-20,
          child: Center(
              child: Text(
                "No hay datos para mostrar",
                style: MainTypography.headlineSecondaryTextStyle,
              )),
        ),
        Positioned(
          left: 10,
          top: 0,
          child: Container(
            width: 63,
            height: 65,
            decoration: getTableIconCardDecoration(iconBgColor),
            child: Icon(
              FontAwesomeIcons.clipboardList,
              color: Colors.white,
              size: 38,
            ),
          ),
        ),
      ],
    );
  }
}
