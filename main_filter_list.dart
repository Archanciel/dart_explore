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
    Book('Sur quelles tendances crypto investir en 2024 ?', ''),
    Book('Tendances crypto en progression en 2024', ''),
    Book('Intelligence artificielle: menace ou opportunité en 2024 ?', ''),
    Book('Intelligence humaine ou artificielle, quelles différences ?', ''),
  ];

  List<String> filterSentencesAnd = [
    'tendances crypto',
    'en 2024',
  ];

  print('books list after AND filter');
  printBooks(filter(books, filterSentencesAnd, FilterType.AND));

  print('\nbooks list after OR filter');
  printBooks(filter(books, filterSentencesAnd, FilterType.OR));
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
      } else {
        isBookFiltered = false;
        break;
      }
    }
    if (filterType == FilterType.AND && isBookFiltered) {
      filteredBooks.add(book);
    } else if (filterType == FilterType.OR && isBookFiltered) {
      filteredBooks.add(book);
    }
  }
  return filteredBooks;
}