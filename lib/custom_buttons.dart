// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
 
class Button extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color, textColor;
  final double? width;
  final Color borderColor;
  final Color shadowColor;
  final Color? iconColor;
  final double? iconSize;
  final double borderRadius;
  final double borderWidth;
  final double padding;
  final Widget? trailing;
  final TextStyle? style;
  final IconData? btnIcon;
  const Button(
      {super.key,
      this.onTap,
      required this.text  ,
      this.color = Colors.transparent,
      this.width,
      this.borderColor = Colors.transparent,
      this.shadowColor = const Color.fromARGB(115, 69, 69, 69),
      this.textColor = Colors.white,
      this.btnIcon,
      this.trailing,
      this.iconColor = Colors.white,
      this.iconSize = 20,
      this.borderRadius = 5,
      this.borderWidth = 1,
      this.padding = 13,
      this.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: padding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: shadowColor,
              offset: Offset(1, 3),
              blurRadius: 5,
            )
          ],
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (btnIcon != null)
                ? Icon(btnIcon, color: iconColor, size: iconSize)
                : SizedBox(),
            (btnIcon != null) ? SizedBox(width: 5) : SizedBox(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: style ?? TextStyle(fontSize: 15, color: textColor),
            ),
            (trailing != null) ? SizedBox(width: 15) : SizedBox(),
            trailing ?? SizedBox()
          ],
        ),
      ),
    );
  }
}

 
 
class CustomDropList extends StatefulWidget {
  final List<DropdownMenuItem<dynamic>> items;
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final String hint;
  final double? width;
  final String? Function(dynamic)? validator;
  final Color color;
  final Color borderColor;
  final Color iconColor;
  final Color hintColor;
  final Color dropdownColor;
  final double borderRadius;
  final TextStyle? style;
  final String? hintText;
  const CustomDropList(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.value,
      required this.hint,
      this.hintText,
      this.validator,
      this.borderRadius = 5,
      this.color = Colors.transparent,
      this.iconColor = Colors.grey,
      this.dropdownColor = Colors.white,
      this.borderColor = Colors.transparent,
      this.hintColor = Colors.grey,
      this.width,
      this.style})
      : super(key: key);

  @override
  _CustomDropdownListState createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      // height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor),
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: DropdownButtonFormField(
        dropdownColor: widget.dropdownColor,
        iconEnabledColor: widget.iconColor,
        iconDisabledColor: widget.hintColor,
        style: widget.style,
        validator: widget.validator,
        // autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
            // hintText: widget.hintText,
            // hintStyle: widget.style?.copyWith(color: widget.hintColor),
            border: InputBorder.none,
            fillColor: Colors.transparent,
            filled: true),
        hint: /* widget.value ?  null: */ Text(
          widget.hint ,
          style: widget.style?.copyWith(color: widget.hintColor),
        ),
        value: widget.value,
        onChanged: widget.onChanged,
        items: widget.items,
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final onTap;
  final Color? color;
  final IconData? btnIcon;
  final Color? iconColor;
  final double? iconSize;
  final double? width;
  const ButtonIcon(
      {Key? key,
      this.onTap,
      this.color,
      this.width,
      this.btnIcon,
      this.iconColor = Colors.white,
      this.iconSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              offset: Offset(1, 3),
              blurRadius: 5,
            )
          ],
          color: color,
        ),
        child: Icon(
          btnIcon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
