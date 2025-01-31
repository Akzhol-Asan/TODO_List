import 'package:flutter/material.dart';

class ButtonDone extends StatelessWidget {
  final String text;

  const ButtonDone({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(17, 173, 136, 1),
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
