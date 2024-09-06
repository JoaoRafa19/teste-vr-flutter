import 'package:mobx/mobx.dart';
import 'package:teste_vr_flutter/domain/entities/dashboard_info_entity.dart';
import 'package:teste_vr_flutter/impl/services/dashboard_info_service.dart';

part 'dashboard_controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  DashboardControllerBase(this.service) {
    init();
  }

  final DashboardInfoService service;

  @observable
  DashboardInfo dashboardInfo = DashboardInfo.invalid();

  @observable 
  bool loading = false;


  Future<void> init() async {
    loading = true;
    final (info, exc) = await service.execute();
    
    if (info.isValid && exc == null){
      dashboardInfo = info;
    }
    loading = false;
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
