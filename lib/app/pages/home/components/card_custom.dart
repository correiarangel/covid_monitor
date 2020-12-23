
import '../../../core/util/value/const_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  
  final controller;
  const CardCustom(this.controller);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: Colors.white,
      margin: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              leading: Container(
                alignment: Alignment.bottomCenter,
                width: 45.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 8.0,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 25,
                      width: 8.0,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 40,
                      width: 8.0,
                      color: ConstColors.primaryColor,
                    ),
                    const SizedBox(width: 4.0),
                    Container(
                      height: 30,
                      width: 8.0,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              title: Text("Paises Afetados"),
              subtitle: Text(controller.word.paisesAfetados.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
