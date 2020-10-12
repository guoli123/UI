import 'package:flutter/material.dart';

/**
 * 充满的button
 * Created by guoshuyu
 * Date: 2018-07-16
 */


class GSYFlexButton extends StatefulWidget {
  final String text;

  Color color;

  Color textColor;

  final VoidCallback onPress;

  final double fontSize;
  final int maxLines;
  bool isCheck;
  final MainAxisAlignment mainAxisAlignment;

  GSYFlexButton(
      {Key key,
        this.text,
        this.color,
        this.textColor,
        this.onPress,
        this.fontSize = 16.0,
        this.mainAxisAlignment = MainAxisAlignment.center,
        this.maxLines = 1,
        this.isCheck=false})
      : super(key: key);

  @override
  _GSYFlexButtonState createState() => new _GSYFlexButtonState();
}

class _GSYFlexButtonState extends State<GSYFlexButton> {


  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.only(
            left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
        textColor: widget.isCheck?Colors.white:Colors.black,
        color:widget.isCheck?Colors.orange:Colors.grey,
        shape: StadiumBorder(),
        child: new Flex(
          mainAxisAlignment: widget.mainAxisAlignment,
          direction: Axis.horizontal,
          children: <Widget>[
            new Expanded(
              child: new Text(widget.text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    letterSpacing: 0.27,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: widget.maxLines,
                  overflow: TextOverflow.clip),
            )
          ],
        ),
        onPressed: () {
          setState(() {
            widget.isCheck=widget.isCheck?false:true;
          });
          widget.onPress?.call();

        });
  }
}
