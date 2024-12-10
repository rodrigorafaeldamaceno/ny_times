import 'package:flutter_modular/flutter_modular.dart';
import 'package:ny_times/modules/articles/articles_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/articles', module: ArticlesModule());
  }
}
