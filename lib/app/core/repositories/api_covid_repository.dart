
import 'package:dio/dio.dart';

import '../models/nation_model.dart';
import '../models/word_model.dart';
import '../services/dio_services.dart';
import 'interface/api_covid_repository_inteface.dart';

class ApiCovidRepository implements IApiCoviReposytory {
  final DioServices client;

  ApiCovidRepository(this.client);

  @override
  Future fillNation({String nation}) async {
    Response response;
    NationModel nationModel;
    response = await client.getNation(nation: nation);
    if (response != null && response.statusCode == 200) {
      nationModel = NationModel.fromJson(response.data);
      return nationModel;
    } else {
      return null;
    }
  }

  @override
  Future fillWord() async {
    Response response = await client.getWord();
    if (response != null && response.statusCode == 200) {
      WordModel wordModel;
      wordModel = WordModel.fromJson(response.data);

      return wordModel;
    } else {

      return null;
    }
  }
}
