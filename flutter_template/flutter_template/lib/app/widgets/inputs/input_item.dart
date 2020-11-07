import 'package:flutter/material.dart';

class InputItem extends StatefulWidget {
  final String dataString;
  final String hintText;
  final String labelText;
  final String helperText;
  final IconData icon;
  final String errorText;
  final Function(String value) onChanged;
  final Widget sufixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool psVisible;

  InputItem({
    Key key,
    this.dataString,
    this.hintText,
    this.textInputAction = TextInputAction.next,
    this.labelText,
    this.helperText,
    this.icon,
    this.errorText,
    this.onChanged,
    this.sufixIcon,
    this.textInputType = TextInputType.text,
    this.psVisible = false,
  }) : super(key: key);

  @override
  _InputItemState createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text =
        widget.dataString != null ? widget.dataString : "";
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: _textEditingController,
        keyboardType: widget.textInputType,
        obscureText: widget.psVisible,
        decoration: InputDecoration(
          fillColor: Theme.of(context).dividerColor,
          hintText: widget.hintText,
          //hintStyle: Theme.of(context).textTheme.headline2,
          contentPadding: EdgeInsets.all(8),
          //here your padding
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              )),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xffECEEF2),
              width: 1.05,
            ),
          ),
          labelText: widget.labelText,
          helperText: widget.helperText,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black,
          ),
          suffixIcon: widget.sufixIcon,
          errorText: widget.errorText,
        ),
        onChanged: widget.onChanged,
        textInputAction: widget.textInputAction,
      ),
    );
  }
}
