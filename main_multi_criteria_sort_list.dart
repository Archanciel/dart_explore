// https://chat.openai.com/share/4e661b29-3cd0-41eb-9a66-2fbb0cdb7a7f

class Person {
  String name;
  int age;
  double salary;
  double fortune;
  int numberOfChildren;
  Person(
    this.name,
    this.age,
    this.salary,
    this.fortune,
    this.numberOfChildren,
  );
  String toString() {
    return 'name: $name, age: $age, salary: $salary, fortune: $fortune, numberOfChildren: $numberOfChildren';
  }
}

const int ascending = 1;
const int descending = -1;

void main() {
  List<Person> persons = [
    Person('Mill', 72, 9999, 3000, 3),
    Person('Jack', 23, 3500, 1800, 1),
    Person('Dill', 50, 9000, 7000, 0),
    Person('Tomo', 23, 4000, 5000, 2),
    Person('Jill', 43, 7000, 2000, 2),
    Person('Will', 50, 9900, 1000, 0),
    Person('Sill', 72, 7000, 7000, 0),
    Person('Bill', 50, 7000, 5000, 5),
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
    ageOrder: descending,
    salaryOrder: descending,
  ));

  List<Person> sortedPersonsByCriteria = sortPersonsByCriteria(
    personsLst: persons,
    criteria: [
      SortCriteria(
        selectorFunction: (p) => p.fortune,
        sortOrder: ascending,
      ),
      SortCriteria(
        selectorFunction: (p) => p.numberOfChildren,
        sortOrder: descending,
      ),
      // Add more criteria as needed
    ],
  );

  print('\npersons list after sort by fortune ascending and numberOfChildren descending');
  printPersons(sortedPersonsByCriteria);

  List<Person> sortedPersonsByFortunePerChild = sortPersonsByCriteria(
    personsLst: persons,
    criteria: [
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
}

List<Person> sortPersons({
  required List<Person> personsLst,
  int ageOrder = ascending,
  int salaryOrder = ascending,
}) {
  List<Person> personLstCopy = List<Person>.from(personsLst);

  personLstCopy.sort((a, b) {
    int compareAge = a.age.compareTo(b.age) * ageOrder;
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
  required List<SortCriteria> criteria,
}) {
  List<Person> personLstCopy = List<Person>.from(personsLst);

  personLstCopy.sort((a, b) {
    for (var criterion in criteria) {
      int comparison = criterion
              .selectorFunction(a)
              .compareTo(criterion.selectorFunction(b)) *
          criterion.sortOrder;
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

