import 'package:flutter_modular/flutter_modular.dart';
import 'package:ny_times/modules/articles/presenter/pages/articles_page.dart';

class ArticlesModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ArticlesPage());
  }
}
