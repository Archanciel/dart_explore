enum FilterType { AND, OR }

class Book {
  String title;
  String summary;

  Book(
    this.title,
    this.summary,
  );
}

void main() {
  List<Book> books = [
    Book('Sur quelle tendance crypto investir en 2024 ?', ''),
    Book('Tendance crypto en progression en 2024', ''),
    Book('Intelligence artificielle: quelle menace ou opportunité en 2024 ?', ''),
    Book('Intelligence humaine ou artificielle, quelles différences ?', ''),
  ];

  List<String> filterSentences = [
    'tendance crypto',
    'en 2024',
  ];

  print('\nbooks list after AND filter sentences <tendance crypto> and <en 2024>');
  printBooks(filter(books, filterSentences, FilterType.AND));

  print('\nbooks list after OR filter sentences <tendance crypto> and <en 2024>');
  printBooks(filter(books, filterSentences, FilterType.OR));

  filterSentences = [
    'en 2024',
    'tendance crypto',
  ];

  print('\nbooks list after AND filter sentences <en 2024> and <tendance crypto>');
  printBooks(filter(books, filterSentences, FilterType.AND));

  print('\nbooks list after OR filter sentences <en 2024> and <tendance crypto>');
  printBooks(filter(books, filterSentences, FilterType.OR));

  filterSentences = [
    'quelle',
    '2024',
  ];

  print('\nbooks list after AND filter sentences <quelle> and <2024>');
  printBooks(filter(books, filterSentences, FilterType.AND));

  print('\nbooks list after OR filter sentences <quelle> and <2024>');
  printBooks(filter(books, filterSentences, FilterType.OR));

  filterSentences = [
    '2024',
    'quelle',
  ];

  print('\nbooks list after AND filter sentences <2024> and <quelle>');
  printBooks(filter(books, filterSentences, FilterType.AND));

  print('\nbooks list after OR filter sentences <2024> and <quelle>');
  printBooks(filter(books, filterSentences, FilterType.OR));
}

void printBooks(List<Book> books) {
  for (Book book in books) {
    print('title: ${book.title}');
  }
}

List<Book> filter(
  List<Book> booksLst,
  List<String> filterSentences,
  FilterType filterType,
) {
  List<Book> filteredBooks = [];
  for (Book book in booksLst) {
    bool isBookFiltered = false;
    for (String filterSentence in filterSentences) {
      if (book.title.toLowerCase().contains(filterSentence.toLowerCase())) {
        isBookFiltered = true;
        if (filterType == FilterType.OR) {
          break;
        }
      } else {
        if (filterType == FilterType.AND) {
          isBookFiltered = false;
          break;
        }
      }
    }
    if (isBookFiltered) {
      filteredBooks.add(book);
    }
  }

  return filteredBooks;
}