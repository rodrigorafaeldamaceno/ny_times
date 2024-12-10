// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleController on _ArticleControllerBase, Store {
  late final _$articlesAtom =
      Atom(name: '_ArticleControllerBase.articles', context: context);

  @override
  ObservableList<ArticleEntity> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableList<ArticleEntity> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$getPopularArticlesAsyncAction = AsyncAction(
      '_ArticleControllerBase.getPopularArticles',
      context: context);

  @override
  Future<void> getPopularArticles({required int interval}) {
    return _$getPopularArticlesAsyncAction
        .run(() => super.getPopularArticles(interval: interval));
  }

  @override
  String toString() {
    return '''
articles: ${articles}
    ''';
  }
}
