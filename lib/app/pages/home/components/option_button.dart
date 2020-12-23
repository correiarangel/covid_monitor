
import '../../../core/util/value/const_colors.dart';
import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final IconData btnicon;
  final Color iconcor;
  final Color btncor;
  final Color corText;
  final double textSize;
  final String text;
  final double top;
  final double rigth;
  final double left;
  final VoidCallback callback;

  const OptionsButton({
    @required this.btnicon,
    @required this.iconcor,
    @required this.btncor,
    @required this.corText,
    @required this.textSize,
    @required this.text,
    @required this.top,
    @required this.rigth,
    @required this.left,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left, right: rigth),
      child: RaisedButton.icon(
        
        hoverColor: ConstColors.purpleLitghColor,
        elevation:6.5 ,
        icon: Icon(
          btnicon,
          color: iconcor,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: corText,
            fontSize: textSize,
            fontWeight: FontWeight.w300
          ),
          textAlign: TextAlign.center,
        ),
        color: btncor,
        padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: callback,
      ),
    );
  }
}
