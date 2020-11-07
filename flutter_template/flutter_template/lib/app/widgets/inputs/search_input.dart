import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final Function(String text) onChange;

  const SearchInput({Key key, this.onChange}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Buscar...',
        contentPadding: EdgeInsets.all(8),
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: onChange,
    );
  }
}
