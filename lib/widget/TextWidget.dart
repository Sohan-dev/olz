import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final double height, width, borderWidth;
  final MaterialColor color, borderColor;
  final String placeholder;
  final String? label;
  final String? hitnText;
  final double radius;
  final bool obsecureText;
  final bool showPasswordEye;
  final Function onSaved;
  final void validator;
  final Function onChanged;
  Icon? prefixIcon;

  TextWidget(
      {Key? key,
      required this.height,
      required this.width,
      this.borderWidth = 1,
      this.radius = 10,
      this.obsecureText = false,
      this.showPasswordEye = false,
      this.prefixIcon,
      this.hitnText,
      required this.color,
      required this.borderColor,
      required this.placeholder,
      required this.textEditingController,
      required this.onSaved,
      this.validator,
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
            return hitnText;
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: placeholder,
          prefixIcon: prefixIcon ?? null,
          suffixIcon:
              showPasswordEye == true ? const Icon(Icons.remove_red_eye) : null,
        ),
      ),
    );
  }
}
