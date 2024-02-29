// https://chat.openai.com/share/4e661b29-3cd0-41eb-9a66-2fbb0cdb7a7f
// look main_date_time_criteria_sort_list.dart as well

class Person {
  String name;
  bool isMan;
  double salary;
  double fortune;
  int numberOfChildren;
  DateTime birthDate;
  Person(
    this.name,
    this.isMan,
    this.salary,
    this.fortune,
    this.numberOfChildren,
    this.birthDate,
  );
  String toString() {
    return 'name: $name, sex: $isMan, sal: $salary, fortu: $fortune, nbChildren: $numberOfChildren, birthDate: $birthDate';
  }
}

const int ascending = 1;
const int descending = -1;

void main() {
  List<Person> persons = [
    Person('Mill', true, 9999, 3000, 3, DateTime(2000, 1, 1, 15, 40)),
    Person('Jola', false, 3500, 1800, 1, DateTime(2000, 1, 1, 16, 30)),
    Person('Dill', true, 9000, 7000, 0, DateTime(2000, 1, 3, 23, 30)),
    Person('Tomo', true, 4000, 5000, 2, DateTime(1999, 1, 1, 15, 30)),
    Person('Jill', true, 7000, 2000, 2, DateTime(2000, 1, 1, 15, 45)),
    Person('Lida', false, 9900, 1000, 0, DateTime(2000, 8, 1, 15, 30)),
    Person('Sill', true, 7000, 7000, 0, DateTime(2000, 1, 1, 15, 38)),
    Person('Sila', false, 7000, 5000, 5, DateTime(2000, 11, 1, 15, 30)),
  ];
  print('persons list before sort');
  printPersons(persons);

  print('\npersons list after sort by age ascending and salary ascending');
  printPersons(sortPersons(
    personsLst: persons,
  ));

  print('\npersons list before sort');
  printPersons(persons);

  print('\npersons list after sort by age descending and salary descending');
  printPersons(sortPersons(
    personsLst: persons,
    fortuneOrder: descending,
    salaryOrder: descending,
  ));

  List<Person> sortedPersonsByCriteria = sortPersonsByCriteria(
    personsLst: persons,
    sortCriteriaLst: [
      SortCriteria(
        selectorFunction: (p) => p.fortune,
        sortOrder: ascending,
      ),
      SortCriteria(
        selectorFunction: (p) => p.numberOfChildren,
        sortOrder: descending,
      ),
      SortCriteria(
        selectorFunction: (p) => p.isMan,
        sortOrder: descending,
      ),
      // Add more criteria as needed
    ],
  );

  print('\npersons list after sort by fortune ascending and numberOfChildren descending');
  printPersons(sortedPersonsByCriteria);

  List<Person> sortedPersonsByFortunePerChild = sortPersonsByCriteria(
    personsLst: persons,
    sortCriteriaLst: [
      SortCriteria(
        selectorFunction: (p) => p.fortune / ((p.numberOfChildren == 0) ? 1 : p.numberOfChildren),
        sortOrder: descending,
      ),
      SortCriteria(
        selectorFunction: (p) => p.numberOfChildren,
        sortOrder: ascending,
      ),
      // Add more criteria as needed
    ],
  );

  print('\npersons list after sort by fortunee per child dscending and numberOfChildren ascending');
  printPersons(sortedPersonsByFortunePerChild);


  List<Person> sortedPersonsByBirthDate = sortPersonsByCriteria(
    personsLst: persons,
    sortCriteriaLst: [
      SortCriteria(
        selectorFunction: (p) {
          DateTime birthDateNoTime = DateTime(p.birthDate.year, p.birthDate.month, p.birthDate.day);
          return birthDateNoTime;
        },
        sortOrder: ascending,
      ),
      // Add more criteria as needed
    ],
  );

  print('\npersons list after sort by birth date ascending');
  printPersons(sortedPersonsByBirthDate);
}

List<Person> sortPersons({
  required List<Person> personsLst,
  int fortuneOrder = ascending,
  int salaryOrder = ascending,
}) {
  List<Person> personLstCopy = List<Person>.from(personsLst);

  personLstCopy.sort((a, b) {
    int compareAge = a.fortune.compareTo(b.fortune) * fortuneOrder;
    if (compareAge != 0) return compareAge;
    int compareSalary = a.salary.compareTo(b.salary) * salaryOrder;
    return compareSalary;
  });

  return personLstCopy;
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
  required List<SortCriteria> sortCriteriaLst,
}) {
  List<Person> personLstCopy = List<Person>.from(personsLst);

  personLstCopy.sort((a, b) {
    for (SortCriteria sortCriteria in sortCriteriaLst) {
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

void printPersons(List<Person> persons) {
  for (Person person in persons) {
    print(person);
  }
}

