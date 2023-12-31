import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
   CalculatorButton({
     required this.label,
    required this.onTap,
    required this.size,
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.black,

});
     String? label;
     VoidCallback? onTap;
     final double size;
     final Color? backgroundColor;
     final Color? labelColor;
@override
Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(6),
    child: Ink(
      width: size,
      height: size,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),],
          borderRadius: BorderRadius.all(
            Radius.circular(size / 2),
          ),
          color: backgroundColor
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size / 2),
          ),
        ),
        onTap:  onTap,
        child: Center(
          child: Text(
              ('$label'),
            style: TextStyle(fontSize: 32,color: labelColor),
          ),
        ),
      ),
    ),
  );
}
}
