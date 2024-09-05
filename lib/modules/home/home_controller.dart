
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';  

enum Pages {
  dashboard,
  students,
  courses,
  instructors,
  evaluations,
  settings
}

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {

  @observable
  Pages current = Pages.dashboard;

  @action
  changePage(Pages newPage) {
    current = newPage;
  }
  
}