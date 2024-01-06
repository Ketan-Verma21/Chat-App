import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String text;
  final bool pass;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const CustomTextField({Key? key, required this.text, required this.pass, required this.controller, this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        obscureText: pass,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color.tertiary
            )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: color.primary
              )
          ),
          filled:true,
          fillColor: color.secondary,
          hintText: text,
          hintStyle: TextStyle(color: color.primary)
        ),
      ),
    );
  }
}
