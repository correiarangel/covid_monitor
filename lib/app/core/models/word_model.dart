class WordModel {
  int casos;
  int mortes;
  int recuperados;
  int paisesAfetados;
  DateTime ultimaAtualizacao;

  WordModel(
      {this.casos,
      this.mortes,
      this.recuperados,
      this.paisesAfetados,
      this.ultimaAtualizacao});

  factory WordModel.fromJson(Map doc) {
    return WordModel(
        casos: doc['cases'],
        mortes: doc['deaths'],
        recuperados: doc['recovered'],
        paisesAfetados: doc['affectedCountries'],
        ultimaAtualizacao: 
          DateTime.fromMillisecondsSinceEpoch(doc['updated']),
    );
  }
}