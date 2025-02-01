import 'package:flutter/material.dart';

class ButtonDone extends StatefulWidget {
  final String text;
  final Function(bool isClicked) doneIsClicked;

  const ButtonDone({
    super.key,
    required this.text,
    required this.doneIsClicked,
  });

  @override
  State<ButtonDone> createState() => _ButtonDoneState();
}

class _ButtonDoneState extends State<ButtonDone> {
  bool isClicked = false;

  void doneIsClicked() {
    setState(() {
      isClicked = !isClicked;
      widget.doneIsClicked(isClicked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isClicked
                ? Color.fromRGBO(147, 147, 147, 1)
                : Color.fromRGBO(17, 173, 136, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: doneIsClicked,
          child: Text(
            widget.text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
