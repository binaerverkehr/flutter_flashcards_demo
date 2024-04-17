import 'package:flutter/material.dart';

class CustomFlipcard extends StatefulWidget {
  final String frontText;
  final String backText;
  final double fontSize;

  const CustomFlipcard({
    Key? key,
    required this.frontText,
    required this.backText,
    this.fontSize = 32,
  }) : super(key: key);

  @override
  State<CustomFlipcard> createState() => _CustomFlipcardState();
}

class _CustomFlipcardState extends State<CustomFlipcard> {
  bool isFront = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFront = !isFront;
        });
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.green,
        child: Center(
          child: Text(
            isFront ? widget.frontText : widget.backText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: widget.fontSize),
          ),
        ),
      ),
    );
  }
}
