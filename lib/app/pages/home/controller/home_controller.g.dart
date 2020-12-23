// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_HomeControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$textFieldControllerAtom =
      Atom(name: '_HomeControllerBase.textFieldController');

  @override
  TextEditingController get textFieldController {
    _$textFieldControllerAtom.reportRead();
    return super.textFieldController;
  }

  @override
  set textFieldController(TextEditingController value) {
    _$textFieldControllerAtom.reportWrite(value, super.textFieldController, () {
      super.textFieldController = value;
    });
  }

  final _$wordAtom = Atom(name: '_HomeControllerBase.word');

  @override
  WordModel get word {
    _$wordAtom.reportRead();
    return super.word;
  }

  @override
  set word(WordModel value) {
    _$wordAtom.reportWrite(value, super.word, () {
      super.word = value;
    });
  }

  final _$nationAtom = Atom(name: '_HomeControllerBase.nation');

  @override
  NationModel get nation {
    _$nationAtom.reportRead();
    return super.nation;
  }

  @override
  set nation(NationModel value) {
    _$nationAtom.reportWrite(value, super.nation, () {
      super.nation = value;
    });
  }

  final _$getInfoWordAsyncAction =
      AsyncAction('_HomeControllerBase.getInfoWord');

  @override
  Future getInfoWord() {
    return _$getInfoWordAsyncAction.run(() => super.getInfoWord());
  }

  final _$getInfoNationAsyncAction =
      AsyncAction('_HomeControllerBase.getInfoNation');

  @override
  Future getInfoNation({String natioN = 'brazil'}) {
    return _$getInfoNationAsyncAction
        .run(() => super.getInfoNation(natioN: natioN));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changePage(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
textFieldController: ${textFieldController},
word: ${word},
nation: ${nation}
    ''';
  }
}
