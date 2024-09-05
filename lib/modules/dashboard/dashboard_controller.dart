import 'package:mobx/mobx.dart';


part 'dashboard_controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {

  @observable
  String teste = "teste";

  @action
  void setTeste(String newVariable) {
    teste = newVariable;
  }

}