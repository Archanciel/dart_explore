// https://chat.openai.com/share/4e661b29-3cd0-41eb-9a66-2fbb0cdb7a7f

import 'package:intl/intl.dart';

class Person {
  String name;
  int age;
  double salary;
  double fortune;
  int numberOfChildren;
  DateTime birthDate;
  Person(
    this.name,
    this.age,
    this.salary,
    this.fortune,
    this.numberOfChildren,
    this.birthDate,
  );
  String toString() {
    return 'name: $name, sal: $salary, fortu: $fortune, nbChildren: $numberOfChildren, birthDate: $birthDate';
  }
}

const int ascending = 1;
const int descending = -1;

void main() {
  List<Person> persons = [
    Person('Mill', 72, 9999, 3000, 3, DateTime(2000, 1, 1, 15, 40)),
    Person('Jack', 23, 3500, 1800, 1, DateTime(2000, 1, 1, 16, 30)),
    Person('Dill', 50, 9000, 7000, 0, DateTime(2000, 1, 3, 23, 30)),
    Person('Tomo', 23, 4000, 5000, 2, DateTime(1999, 1, 1, 15, 30)),
    Person('Jill', 43, 7000, 2000, 2, DateTime(2000, 1, 1, 15, 45)),
    Person('Will', 50, 9900, 1000, 0, DateTime(2000, 8, 1, 15, 30)),
    Person('Sill', 72, 7000, 7000, 0, DateTime(2000, 1, 1, 15, 38)),
    Person('Bill', 50, 7000, 5000, 5, DateTime(2000, 11, 1, 15, 30)),
  ];
  print('persons list before sort');
  printPersons(persons);

  List<Person> sortedPersonsByBirthDate = sortPersonsByCriteria(
    personsLst: persons,
    sortCriteriaLst: [
      SortCriteria<Person>(
        selectorFunction: (Person p) {
          return stripTime(p.birthDate);
        },
        sortOrder: ascending,
      ),
      // Add more criteria as needed
    ],
  );

  print('\npersons list after sort by birth date ascending');
  printPersons(sortedPersonsByBirthDate);
}
class SortCriteria<T> {
  final Comparable Function(T) selectorFunction;
  final int sortOrder;

  SortCriteria({
    required this.selectorFunction,
    required this.sortOrder,
  });
}

List<Person> sortPersonsByCriteria({
  required List<Person> personsLst,
  required List<SortCriteria<Person>> sortCriteriaLst,
}) {
  List<Person> personLstCopy = List<Person>.from(personsLst);

  personLstCopy.sort((a, b) {
    for (SortCriteria<Person> sortCriteria in sortCriteriaLst) {
      int comparison = sortCriteria
              .selectorFunction(a)
              .compareTo(sortCriteria.selectorFunction(b)) *
          sortCriteria.sortOrder;
      if (comparison != 0) return comparison;
    }
    return 0;
  });

  return personLstCopy;
}

DateTime stripTime(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateFormat englishDateFormat = DateFormat("yyyy-MM-dd");

DateTime truncateDateTimeToDay(DateTime dateTime) {
    return englishDateFormat.parse(englishDateFormat.format(dateTime));
}

void printPersons(List<Person> persons) {
  for (Person person in persons) {
    print(person);
  }
}

