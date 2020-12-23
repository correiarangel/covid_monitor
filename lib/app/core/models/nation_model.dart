
import 'word_model.dart';

class NationModel extends WordModel {
  String nome;
  int mortesHoje;
  int criticos;
  String urlBandeira;
  int casosHoje;
  int recuperadosHoje;
  int casosPorMilhao;
  int mortesPorMilhao;
  int testes;
  int testesPorMilhao;
  int populacao;

  NationModel(
      {this.nome,
      this.mortesHoje,
      this.criticos,
      this.urlBandeira,
      this.casosHoje,
      this.recuperadosHoje,
      this.casosPorMilhao,
      this.mortesPorMilhao,
      this.testes,
      this.testesPorMilhao,
      this.populacao,
      int casos,
      int mortes,
      int recuperados})
      : super(casos: casos, mortes: mortes, recuperados: recuperados);

  /* NationModel(
      {this.nome,
      this.criticos,
      this.mortesHoje,
      this.urlBandeira,
      int casos,
      int mortes,
      int recuperados})
      : super(casos: casos, mortes: mortes, recuperados: recuperados);*/

  factory NationModel.fromJson(Map map) {
    return NationModel(
      casos: map['cases'],
      mortes: map['deaths'],
      recuperados: map['recovered'],
      mortesHoje: map['todayDeaths'],
      casosHoje: map["todayCases"],
      recuperadosHoje: map["todayRecovered"],
      casosPorMilhao: map["casesPerOneMillion"],
      mortesPorMilhao: map["deathsPerOneMillion"],
      testes: map["tests"],
      testesPorMilhao: map["testsPerOneMillion"],
      populacao: map["population"],
      nome: map['country'],
      criticos: map['critical'],
      urlBandeira: map['countryInfo']['flag'],
    );
  }
}
