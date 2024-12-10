abstract class ArticleException implements Exception {
  final String message;

  ArticleException(this.message);
}

class ArticleNotFoundException extends ArticleException {
  ArticleNotFoundException(super.message);
}

class ArticleListEmptyException extends ArticleException {
  ArticleListEmptyException(super.message);
}

class ArticleListException extends ArticleException {
  ArticleListException(super.message);
}

class ArticleListServerException extends ArticleException {
  ArticleListServerException(super.message);
}
