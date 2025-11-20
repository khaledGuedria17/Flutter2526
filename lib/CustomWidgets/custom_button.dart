import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  //var
  final String title;
  final Color color;
  const CustomButton(this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),

      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
