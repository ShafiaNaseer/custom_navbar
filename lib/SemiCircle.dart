

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedSemiCircle extends StatelessWidget {
  const SelectedSemiCircle({Key? key, required this.text, required this.lengthOfText}) : super(key: key);
  final String text;
  final double lengthOfText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
          right: -30,
          bottom: -50,
          child: Container(
            height: lengthOfText,
            width: lengthOfText/2,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(120),
                bottomRight: Radius.circular(120),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 4,
                width: 4,
                constraints: const BoxConstraints(maxHeight: 8, maxWidth: 8),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
        )
      ],
    );
  }
}