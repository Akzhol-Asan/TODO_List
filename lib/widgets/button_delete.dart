import 'package:flutter/material.dart';

class ButtonDelete extends StatelessWidget {
  final String text;
  final VoidCallback delete;

  const ButtonDelete({
    super.key,
    required this.text,
    required this.delete,
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
          onPressed: delete,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
