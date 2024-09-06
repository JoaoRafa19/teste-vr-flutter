import 'package:teste_vr_flutter/domain/repositories/i_dashboard_repository.dart';

abstract interface class RepositoryFactory {
  IDashboardRepository get dashboardRepository;
}