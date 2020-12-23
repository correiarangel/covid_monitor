import 'package:package_info/package_info.dart';

import 'components/card_about.dart';
import 'components/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/util/value/const_colors.dart';
import 'components/card_custom.dart';
import 'components/components_custom.dart';
import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  var buildNumber;
  var version;
  final _componentsCustom = ComponentsCustom();
  var _urlEmail =
      'mailto:okcomputer.use.linux@gmail.com?subject=News&body=New plugin';
  var _urlLinkDin =
      "https://www.linkedin.com/in/marcos-fabiano-correia-rangel/";

  dynamic getBuildAndVersion() async {
    var packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }

  @override
  void initState() {
    getBuildAndVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: ConstColors.purpleUltraLitghColor,
        body: (this.controller.word != null && this.controller.nation != null)
            ? _buildBody()
            : Center(child: CircularProgressIndicator(
                backgroundColor: ConstColors.primaryColor,
            )),
        bottomNavigationBar: _componentsCustom.buildBottomBar(controller),
      );
    });
  }

  // ignore: missing_return
  Widget _buildBody() {
    switch (this.controller.currentIndex) {
      case 0:
        return _buildBodyWord();
        break;
      case 1:
        return _buildBodyNation();
        break;
      case 2:
        return _buildBodyAbout();
        break;
    }
  }

  Widget _buildBodyWord() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _componentsCustom.buildHeader(
              "COVID MONITOR\nSTATUS MUNDIAL ", context, controller),
          const SizedBox(height: 21.0),
          CardCustom(controller),
          _componentsCustom.buildRow(
              ConstColors.secundColor,
              Icons.person_remove_alt_1,
              "Total de Infectados",
              controller.word.casos.toString()),
          const SizedBox(height: 21.0),
          _componentsCustom.buildRow(ConstColors.redColor,
          Icons.person_add_disabled,
              "Mortes", controller.word.mortes.toString()),
          const SizedBox(height: 21.0),
          _componentsCustom.buildRow(ConstColors.greenLitghColor, Icons.person,
              "Recuperados", controller.word.recuperados.toString()),
          const SizedBox(height: 21.0),
        ],
      ),
    );
  }

  Widget _buildBodyNation() {
    var pais = controller.nation.nome;
    var _url = controller.nation.urlBandeira;
    var populacao = controller.nation.populacao;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _componentsCustom.buildHeader(
              "$pais \nPapulação : $populacao", context, controller,
              isPais: true, url: _url),
          const SizedBox(height: 21.0),
          controller.nation.casos > 0
              ? _componentsCustom.buildRow(
                  ConstColors.secundColor,
                  Icons.person_remove_alt_1,
                  "Total de Infectados",
                  controller.nation.casos.toString())
              : SizedBox(height: 0),
          const SizedBox(height: 21.0),
          controller.nation.recuperados > 0
              ? _componentsCustom.buildRow(
                  ConstColors.greenLitghColor,
                  Icons.person,
                  "Recuperados",
                  controller.nation.recuperados.toString())
              : SizedBox(height: 0),
          const SizedBox(height: 21.0),
          controller.nation.recuperadosHoje > 0
              ? _componentsCustom.buildRow(
                  ConstColors.greenLitghColor,
                  Icons.person,
                  "Recuperados dia",
                  controller.nation.recuperadosHoje.toString())
              : SizedBox(height: 0),
          const SizedBox(height: 21.0),
          controller.nation.testes > 0
              ? _componentsCustom.buildRow(
                  ConstColors.purpleLitghColor,
                  Icons.person_add_alt,
                  "Testes\nrealizado",
                  controller.nation.testes.toString())
              : SizedBox(height: 0),
          const SizedBox(height: 21.0),
          controller.nation.testesPorMilhao > 0
              ? _componentsCustom.buildRow(
                  ConstColors.purpleLitghColor,
                  Icons.person_add_alt,
                  "Testes\n realizado por\n milhão ",
                  controller.nation.testesPorMilhao.toString())
              : SizedBox(height: 0),
          const SizedBox(height: 21.0),
          controller.nation.casosHoje > 0
              ? _componentsCustom.buildRow(
                  ConstColors.redColor,
                  Icons.person_add_disabled,
                  "Total caso dia",
                  controller.nation.casosHoje.toString())
              : SizedBox(height: 0),
          const SizedBox(height: 21.0),
          controller.nation.mortesHoje > 0
              ? _componentsCustom.buildRow(
                  ConstColors.redColor,
                  Icons.person_add_disabled,
                  "Total de\n mortes dia",
                  controller.nation.mortesHoje.toString())
              : SizedBox(height: 0),
          const SizedBox(height: 21.0),
          controller.nation.mortes > 0
              ? _componentsCustom.buildRow(
                  ConstColors.redColor,
                  Icons.person_add_disabled,
                  "Mortes",
                  controller.nation.mortes.toString())
              : SizedBox(height: 0),
          const SizedBox(height: 21.0),
        ],
      ),
    );
  }

  Widget _buildBodyAbout() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _componentsCustom.buildHeader(
              "COVID MONITOR INFO", context, controller),
          const SizedBox(height: 30.0),
          CardAbout(buildNumber, version),
          OptionsButton(
            btnicon: Icons.email,
            iconcor: Colors.white,
            btncor: ConstColors.secundColor,
            corText: Colors.white,
            textSize: 18.0,
            text: "ENVIAR E-MAIL @             ",
            top: 21.0,
            rigth: 12.0,
            left: 12.0,
            callback: () {
              controller.launchURL(_urlEmail);
            },
          ),
          OptionsButton(
            btnicon: Icons.pages,
            iconcor: Colors.white,
            btncor: ConstColors.secundColor,
            corText: Colors.white,
            textSize: 18.0,
            text: "VISITAR LINKDIN             ",
            top: 21.0,
            rigth: 12.0,
            left: 12.0,
            callback: () {
              controller.launchURL(_urlLinkDin);
            },
          ),
          const SizedBox(height: 21.0),
        ],
      ),
    );
  }
}
