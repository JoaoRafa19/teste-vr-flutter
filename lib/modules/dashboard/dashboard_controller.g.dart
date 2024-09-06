// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardController on DashboardControllerBase, Store {
  late final _$dashboardInfoAtom =
      Atom(name: 'DashboardControllerBase.dashboardInfo', context: context);

  @override
  DashboardInfo get dashboardInfo {
    _$dashboardInfoAtom.reportRead();
    return super.dashboardInfo;
  }

  @override
  set dashboardInfo(DashboardInfo value) {
    _$dashboardInfoAtom.reportWrite(value, super.dashboardInfo, () {
      super.dashboardInfo = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'DashboardControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$touchedIndexAtom =
      Atom(name: 'DashboardControllerBase.touchedIndex', context: context);

  @override
  int get touchedIndex {
    _$touchedIndexAtom.reportRead();
    return super.touchedIndex;
  }

  @override
  set touchedIndex(int value) {
    _$touchedIndexAtom.reportWrite(value, super.touchedIndex, () {
      super.touchedIndex = value;
    });
  }

  late final _$testeAtom =
      Atom(name: 'DashboardControllerBase.teste', context: context);

  @override
  String get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(String value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  late final _$DashboardControllerBaseActionController =
      ActionController(name: 'DashboardControllerBase', context: context);

  @override
  void setTeste(String newVariable) {
    final _$actionInfo = _$DashboardControllerBaseActionController.startAction(
        name: 'DashboardControllerBase.setTeste');
    try {
      return super.setTeste(newVariable);
    } finally {
      _$DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dashboardInfo: ${dashboardInfo},
loading: ${loading},
touchedIndex: ${touchedIndex},
teste: ${teste}
    ''';
  }
}
