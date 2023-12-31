
import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
   String text;
   ResultDisplay({required this.text});
   int? result;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: 80,
          color: Colors.black,
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 24),
            child: Text(
              '$text',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34
              ),
            ),

          ),
    );
  }
}
