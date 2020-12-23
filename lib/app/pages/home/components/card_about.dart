import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../../../core/util/value/const_colors.dart';

// ignore: must_be_immutable
class CardAbout extends StatelessWidget {
  final buildNumber;
  final version;

  const CardAbout(this.buildNumber, this.version);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 8.0,
      color: ConstColors.secundColor,
      margin: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Text(
                  "Info:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21.0),
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Versão: $version.$buildNumber\n"
                  "O aplicativo Covid Monitor exibe "
                  "dados de pandemia de Covid-19,"
                  "\nem nivel nacional e mundial.\n"
                  "Desenvolvido por: Marcos Rangel,Desenvolvedor Mobile\n",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
