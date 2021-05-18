
import 'package:cardeno_de_oracao/styles/styles.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  InputTextField({required this.hintText, required this.obscureText, required this.validator, required this.onSaved});

  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final FormFieldValidator<String>? onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
      margin: EdgeInsets.all(8),
      decoration: raisedDecoration,
      child: Center(
        child: TextFormField(
          obscureText: obscureText,
          validator: validator,
          onSaved: onSaved,
          decoration: InputDecoration(
            errorBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.black38
              )
          ),
        ),
      ),
    );
  }
}
