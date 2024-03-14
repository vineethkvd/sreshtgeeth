import 'package:flutter/material.dart';

class Txt2 extends StatelessWidget {
  final String text;
  final double fsize;
  final FontWeight weight;
  final int lines;
  final Color color;
  final bool defalutsize;
  final bool iscenter;
  final double hieght;
  final bool underline;
  const Txt2(
      {Key? key,
        this.text = '',
        this.fsize = 0,
        this.iscenter = false,
        this.underline = false,
        this.lines = 1000,
        this.color = Colors.black87,
        this.defalutsize = false,
        this.hieght = 1.2,
        this.weight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.length>10?text.substring(0,7)+"....":text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: iscenter ? TextAlign.center : TextAlign.start,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
