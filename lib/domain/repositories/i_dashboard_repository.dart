import 'package:teste_vr_flutter/domain/entities/dashboard_info_entity.dart';

abstract interface class IDashboardRepository {
  Future<(DashboardInfo, Exception?)> getDashboardInfo();
}
