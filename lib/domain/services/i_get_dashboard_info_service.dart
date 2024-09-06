import '../entities/dashboard_info_entity.dart';

abstract interface class IGetDashboardInfoService {
  Future<(DashboardInfo, Exception?)> execute();
}
