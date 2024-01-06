import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(child: Text(text)),
        decoration: BoxDecoration(
          color: color.secondary,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    ) ;
  }
}
