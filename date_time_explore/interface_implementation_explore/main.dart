// https://stackoverflow.com/questions/72074086/dart-using-abstract-classes-as-interface-an-meaningful-design-example

abstract class HumanInterface {
  // THE COMMENTED CODE HAS NO UTILITY IN A PURE ABSTRACT INTERFACE CLASS !
  //String _name;
  //HumanInterface(String name) : _name = name;

  String get name;
}

abstract class ParentInterface {
  void incrementChildNumber();
  int get childNumber;
}

abstract class EmployeeInterface implements HumanInterface {
  // extends can be used in place of implements !
  set salary(double salary);
  double get salary;
}

class Adult implements EmployeeInterface, ParentInterface {
  final String _name; // from HumanInterface implemented by EmployeeInterface
  double _salary; // from EmployeeInterface
  int _childNumber = 0; // from ParentInterface

  Adult(String name, double salary)
      : _name = name,
        _salary = salary;

  String get name => _name;

  double get salary => _salary;
  set salary(double salary) => _salary = salary;

  void incrementChildNumber() => _childNumber++;
  int get childNumber => _childNumber;
}

class MyFriends {
  /// Uses Adult as HumanInterface only
  List<HumanInterface> _friendLst = [];

  void addFriend(HumanInterface friend) => _friendLst.add(friend);
  void printMyFriends() {
    String toPrint = 'My friends:';

    for (HumanInterface friend in _friendLst) {
      toPrint += ' ${friend.name}';
    }

    print(toPrint);
  }
}

class Enterprise {
  /// Uses Adult as EmployeeInterface only
  List<EmployeeInterface> _employeeLst;

  Enterprise() : _employeeLst = [];

  void addEmployee(EmployeeInterface employee) => _employeeLst.add(employee);
  void printMonthlyTotalSalary() {
    double _totalSalary = 0;

    for (EmployeeInterface employee in _employeeLst) {
      _totalSalary += employee.salary;
    }

    print('Paying monthly: $_totalSalary');
  }

  void printEmployees() {
    String toPrint = 'Our employees:';

    for (EmployeeInterface employee in _employeeLst) {
      toPrint += ' ${employee.name} ${employee.salary}';
    }

    print(toPrint);
  }
}

class RemarriedCouple {
  /// Uses Adult as ParentInterface only
  ParentInterface _husband;
  ParentInterface _spouse;

  RemarriedCouple(ParentInterface husband, ParentInterface spouse)
      : _husband = husband,
        _spouse = spouse;

  int getChildrenNumber() => _husband.childNumber + _spouse.childNumber;
}

void main() {
  Adult adult = Adult('Joe', 10000);
  adult.incrementChildNumber();
  print('${adult.name} ${adult.salary} ${adult.childNumber}'); // Joe 10000.0 1

  EmployeeInterface employee = adult;
  print(employee.salary); // 10000.0
  print(employee.name); // Joe
//print(employee.childNumber); // compile error: The getter 'childNumber'
//                                isn't defined for the type 'EmployeeInterface'

  HumanInterface human = adult;
  print(human.name); // Joe
//print(human.salary); // compile error: The getter 'salary' isn't defined
//                        for the type 'HumanInterface'

  Adult adult2 = Adult('Carla', 11000);
  adult2.incrementChildNumber();
  adult2.incrementChildNumber();

  MyFriends myFriends = MyFriends();
  myFriends.addFriend(adult);
  myFriends.addFriend(adult2);
  myFriends.printMyFriends(); // My friends: Joe Carla

  Enterprise enterprise = Enterprise();
  enterprise.addEmployee(adult);
  enterprise.addEmployee(adult2);
  enterprise.printEmployees(); // Our employees Joe 10000.0 Carla 11000.0
  enterprise.printMonthlyTotalSalary(); // Paying monthly: 21000.0

  RemarriedCouple couple = RemarriedCouple(adult, adult2);
  print('Child number: ${couple.getChildrenNumber()}'); // Child number: 3
}
