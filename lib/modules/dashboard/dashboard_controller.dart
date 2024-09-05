import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  DashboardControllerBase();

  Future<void> init() async {

  }

  @observable
  int touchedIndex = -1;

  @observable
  String teste = "teste";

  @action
  void setTeste(String newVariable) {
    teste = newVariable;
  }
}
