import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    super.key,
    required this.hintText,
    this.prefix,
    this.text,
    this.labelText,
    this.sufix,
    this.borderColor,
    this.textStyleColor = Colors.white,
    this.hintColor = Colors.white,
    this.foucusBorder,
    this.maxLines = 1,
    this.onChanged,
    this.controller,
    this.isFill = false,
    this.security = false,
    this.keyboardType,
    this.fillColor,
    this.validator,
    this.onSubmit,
  });

  MyValidator? validator;
  String hintText;
  String? text;
  Widget? prefix;
  Widget? sufix;
  TextEditingController? controller;
  String? labelText;
  Color? borderColor;
  Color? hintColor;
  int maxLines;
  bool security;
  bool? isFill;
  Color? fillColor;
  Color? textStyleColor;
  Color? foucusBorder;
 
  TextInputType? keyboardType;
  Function(String)? onChanged;
  Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    return StatefulBuilder(
      builder: (context, setState) {
        focusNode.addListener(() {
          setState(() {});
        });

        final isFocused = focusNode.hasFocus;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            obscureText: security,
            keyboardType: keyboardType,
            textDirection: TextDirection.rtl,
            maxLines: maxLines,
            style: TextStyle(color: textStyleColor),
            cursorColor: Colors.tealAccent,
            validator: validator,
            onChanged: onChanged,
            onFieldSubmitted:onSubmit ,
            decoration: InputDecoration(
              hintText: hintText,
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(color:hintColor 
              
               ),
              filled: isFill,
              fillColor: 
                  fillColor,
                  
              prefixIcon: prefix,
              suffixIcon: sufix,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide:
                    BorderSide(color: foucusBorder ?? Colors.tealAccent, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
            ),
          ),
        );
      },
    );
  }
}

