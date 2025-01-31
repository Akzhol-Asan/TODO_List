import 'package:flutter/material.dart';

class ButtonDelete extends StatelessWidget {
  final String text;

  const ButtonDelete({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(191, 71, 61, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
