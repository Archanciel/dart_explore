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
    Person('Mill', 72, 12500, 2000000, 3),
    Person('Jack', 23, 3500, 180000, 1),
    Person('Dill', 50, 9000, 70000, 0),
    Person('Tom', 23, 4000, 5000000, 2),
    Person('Jill', 43, 7000, 2000000, 2),
    Person('Will', 50, 10000, 100000, 0),
    Person('Sill', 72, 7000, 7000000, 0),
    Person('Bill', 50, 7000, 5000, 10),
  ];
  print('persons list before sort');
  print(persons);

  print('\npersons list after sort by age ascending and salary ascending');
  print(sortPersons(
    personsLst: persons,
  ));

  print('\npersons list before sort');
  print(persons);

  print('\npersons list after sort by age descending and salary descending');
  print(sortPersons(
    personsLst: persons,
    ageOrder: descending,
    salaryOrder: descending,
  ));

  List<Person> sortedPersonsByCriteria = sortPersonsByCriteria(
    personsLst: persons,
    criteria: [
      SortCriteria(
        (p) => p.fortune,
        ascending,
      ),
      SortCriteria(
        (p) => p.numberOfChildren,
        descending,
      ),
      // Add more criteria as needed
    ],
  );

  print('\npersons list after sort by criteria');
  print(sortedPersonsByCriteria);
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
  final Comparable Function(T) selector;
  final int order;

  SortCriteria(this.selector, this.order);
}

List<Person> sortPersonsByCriteria({
  required List<Person> personsLst,
  required List<SortCriteria> criteria,
}) {
  List<Person> personLstCopy = List<Person>.from(personsLst);

  personLstCopy.sort((a, b) {
    for (var criterion in criteria) {
      int comparison = criterion.selector(a).compareTo(criterion.selector(b)) *
          criterion.order;
      if (comparison != 0) return comparison;
    }
    return 0;
  });

  return personLstCopy;
}
