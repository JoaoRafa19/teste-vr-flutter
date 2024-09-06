import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/core/env/env.dart';
import 'package:teste_vr_flutter/core/rest_client/dio_rest_client.dart';
import 'package:teste_vr_flutter/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(RestClient(Env.backendBaseUrl));
  
    super.binds(i);
  }

  @override
  void routes(r) {
    r.module("/home", module: HomeModule());
  }
}
