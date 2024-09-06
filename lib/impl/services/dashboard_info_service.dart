import 'package:teste_vr_flutter/core/rest_client/dio_rest_client.dart';
import 'package:teste_vr_flutter/domain/entities/dashboard_info_entity.dart';
import 'package:teste_vr_flutter/domain/services/i_get_dashboard_info_service.dart';
import 'package:teste_vr_flutter/impl/serializers/dashboard_info_serializer.dart';

class DashboardInfoService implements IGetDashboardInfoService {
  final RestClient _client;
  DashboardInfoService(this._client);
  @override
  Future<(DashboardInfo, Exception?)> execute() async {
    try {
      final response = await _client.get("/dashboard");
      if (response.statusCode == 200) {
        final info = DashboardInfoSerializer.fromJson(response.data);
        return (info, null);
      }
      throw Exception();
    } catch (e) {
      return (DashboardInfo.invalid(), Exception("erro ao buscar dados"));
    }
  }
}
