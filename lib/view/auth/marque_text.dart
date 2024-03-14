import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Marquetext extends StatelessWidget {
  final mtext;
  const Marquetext({
    super.key,
    required this.mtext,
  });


  @override
  Widget build(BuildContext context) {
    return Marquee(
      blankSpace: 60.0,
      text: mtext,
    );
  }
}