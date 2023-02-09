import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final double height, width, borderWidth;
  final MaterialColor color, borderColor;
  final String placeholder;
  final String? label;
  final double radius;
  final bool obsecureText;
  final bool showPasswordEye;
  final Function onSaved;
  final Function validator;
  final Function onChanged;
  Icon? prefixIcon;
  // bool _validate ;

  TextWidget(
      {Key? key,
      required this.height,
      required this.width,
      this.borderWidth = 1,
      this.radius = 10,
      this.obsecureText = false,
      this.showPasswordEye = false,
      this.prefixIcon,
      required this.color,
      required this.borderColor,
      required this.placeholder,
      required this.textEditingController,
      required this.onSaved,
      required this.validator,
      required this.onChanged,
      this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextFormField(
        controller: textEditingController,
        autofocus: true,
        obscureText: obsecureText,
        onChanged: (value) => {onChanged(value)},
        onSaved: (data) => {onSaved(data)},
        validator: (value) {
          if (value!.isEmpty) {
            return 'UID is required';
          }
          return null;

          // return validator(value);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // labelText: label,
          // errorText:  ,

          hintText: placeholder,
          prefixIcon: prefixIcon ?? null,

          suffixIcon:
              showPasswordEye == true ? const Icon(Icons.remove_red_eye) : null,
          // border: InputBorder.none
        ),
      ),
    );
  }
}
