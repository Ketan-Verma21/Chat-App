import 'package:flutter/material.dart';
class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({Key? key, required this.text,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 20,),
            Text(text),
          ],
        ),
      ),
    );
  }
}
