import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/models/nation_model.dart';
import '../../../core/models/word_model.dart';
import '../../../core/repositories/api_covid_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<ApiCovidRepository>();

  _HomeControllerBase() {
    getInfoWord();
    getInfoNation();
  }

  @observable
  int currentIndex = 0;

  @observable
  TextEditingController textFieldController = TextEditingController();

  @observable
  WordModel word;

  @observable
  NationModel nation;

  @action
  getInfoWord() async {
    word = await api.fillWord();
  }

  @action
  getInfoNation({String natioN}) async {
    natioN == null ? natioN = 'BRAZIL' : natioN;
    try {
      nation = await api.fillNation(nation: natioN);
    } catch (err) {
      return Container();
    }
  }

  @action
  changePage(int index) {
    currentIndex = index;
  }

  launchURL(_url) async {        
    final url = Uri.encodeFull(_url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
