import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/typography.dart';
import 'package:flutter_template/app/widgets/tables/model/custom_comparable.dart';
import 'package:flutter_template/app/widgets/tables/model/fixable.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

List<ProductModel> exampleList = [
  ProductModel(
      productId: 1,
      productName: "nuevo1",
      productPrice: "45.00",
      isActive: true,
      productDescription: "Producto nuevo"),
  ProductModel(
      productId: 2,
      productName: "nuevo2",
      productPrice: "35.00",
      isActive: false,
      productDescription: "Producto nuevo2"),
  ProductModel(
      productId: 3,
      productName: "nuevo3",
      productPrice: "28.00",
      isActive: true,
      productDescription: "Producto nuevo3"),
  ProductModel(
      productId: 4,
      productName: "nuevo4",
      productPrice: "90.00",
      isActive: true,
      productDescription: "Producto nuev4"),
  ProductModel(
      productId: 5,
      productName: "nuevo5",
      productPrice: "18.00",
      isActive: true,
      productDescription: "Producto nuevo5"),
  ProductModel(
      productId: 6,
      productName: "nuevo6",
      productPrice: "32.00",
      isActive: false,
      productDescription: "Producto nuevo6"),
  ProductModel(
      productId: 7,
      productName: "nuevo7",
      productPrice: "27.00",
      isActive: true,
      productDescription: "Producto nuevo7"),
  ProductModel(
      productId: 8,
      productName: "nuevo8",
      productPrice: "19.00",
      isActive: false,
      productDescription: "Producto nuevo8"),
];

class ProductModel implements Fixable, CustomComparable {
  ProductModel(
      {this.productName,
      this.productPrice,
      this.productDescription,
      this.isActive,
      this.productId});

  final int actionsFlex = 3;
  String productName;
  String productPrice;
  String productDescription;
  int productId;
  bool isActive;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productName: json["productName"],
        productId: json["productId"],
        productPrice: json["productPrice"],
        productDescription: json["productDescription"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productId": productId,
        "productPrice": productPrice,
        "productDescription": productDescription,
        "isActive": isActive,
      };

  @override
  List<Widget> getBodyFix() {
    List<Widget> bodyData = List();
    bodyData.add(Expanded(
      flex: 1,
      child: Text(
        productName,
        style: MainTypography.bodyTextStyle,
      ),
    ));
    bodyData.add(Expanded(
      flex: 1,
      child: Text(
        "\$$productPrice",
        style: MainTypography.bodyTextStyle,
      ),
    ));
    bodyData.add(Expanded(
      flex: 2,
      child: Text(
        productDescription,
        style: MainTypography.bodyTextStyle,
      ),
    ));
    bodyData.add(Expanded(
      flex: 1,
      child: Text(
        isActive ? "Activo" : "Deshabilitado",
        style: MainTypography.bodyTextStyle,
      ),
    ));
    return bodyData;
  }

  @override
  List<Widget> getTitleFix() {
    List<Widget> tittleList = List();
    tittleList.add(Expanded(
      flex: 1,
      child: Text(
        "No.",
        style: MainTypography.bodyTextStyle,
      ),
    ));
    tittleList.add(Expanded(
      flex: 1,
      child: Text(
        "Nombre",
        style: MainTypography.bodyTextStyle,
      ),
    ));
    tittleList.add(Expanded(
      flex: 1,
      child: Text(
        "Precio",
        style: MainTypography.bodyTextStyle,
      ),
    ));
    tittleList.add(Expanded(
      flex: 2,
      child: Text(
        "Descripción",
        style: MainTypography.bodyTextStyle,
      ),
    ));
    tittleList.add(Expanded(
      flex: 1,
      child: Text(
        "Estado",
        style: MainTypography.bodyTextStyle,
      ),
    ));
    tittleList.add(Expanded(
      flex: actionsFlex,
      child: Text(
        "Acciones",
        style: MainTypography.bodyTextStyle,
      ),
    ));
    return tittleList;
  }

  @override
  int getActionsFlex() {
    return actionsFlex;
  }

  @override
  bool compareOn(String text) {
    text = text.toLowerCase();
    return this.productName.toLowerCase().contains(text) ||
        this.productPrice.toLowerCase().contains(text) ||
        this.productDescription.toLowerCase().contains(text) ||
        (text.contains("activo") && isActive ||
            text.contains("deshabilitado") && !isActive);
  }

  @override
  String toString() {
    return 'ProductModel{actionsFlex: $actionsFlex, productName: $productName, productPrice: $productPrice, productDescription: $productDescription, productId: $productId, isActive: $isActive}';
  }

  @override
  List<Widget> getBodyToMobile() {
    return <Widget>[
      Container(
        margin: EdgeInsets.all(4),
        child: _drawRow("Nombre", this.productName),
      ),
      Container(
        margin: EdgeInsets.all(4),
        child: _drawRow("Descripción", this.productDescription),
      ),
      Container(
        margin: EdgeInsets.all(4),
        child: _drawRow("Precio", this.productPrice),
      ),
      Container(
        margin: EdgeInsets.all(4),
        child: _drawRow("Estado", isActive ? "Activo" : "Deshabilitado"),
      ),
    ];
  }

  Widget _drawRow(String title, String value) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title,
          style: MainTypography.bodyTextStyle
              .copyWith(fontWeight: FontWeight.bold),
        )),
        Expanded(
            child: Text(
          value,
          style: MainTypography.bodyTextStyle,
        )),
      ],
    );
  }

  @override
  int getId() {
    return productId;
  }
}
