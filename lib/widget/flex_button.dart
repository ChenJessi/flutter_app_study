import 'package:flutter/material.dart';
import '';


/// 充满的button
class FlexButton extends StatelessWidget{

  final String? text;
  final Color? color;
  final Color? textColor;

  final VoidCallback? onPress;

  final double fontSize;
  final int maxLines;

  final MainAxisAlignment mainAxisAlignment;


  FlexButton({
    Key? key,
    this.text,
    this.color,
    this.textColor = Colors.black,
    this.onPress,
    this.fontSize = 20.0,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.maxLines = 1
});

  @override
  Widget build(BuildContext context) {
     return new ElevatedButton(
       style: ElevatedButton.styleFrom(
         backgroundColor: color,
         padding: new EdgeInsets.only(
             left: 20.0, top: 10.0, right: 20.0, bottom: 10.0)),
       child: new Flex(
         mainAxisAlignment: mainAxisAlignment,
         direction: Axis.horizontal,
         children:<Widget>[
           new Expanded(
             child: new Text(text??"", style: new TextStyle(
               color: textColor, fontSize: fontSize, height: 1,),
                 textAlign: TextAlign.center,
                 maxLines: maxLines,
                 overflow: TextOverflow.ellipsis
             ),
           ),
         ]
       ),
       onPressed: onPress,
     );
  }




}