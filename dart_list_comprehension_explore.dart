import 'dart:math';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  // using if without curly braces

  var includeSquares = true;
  var allWithSquares = [
    for (var n in numbers)
      if (includeSquares) ...[n, n * n],
  ];

  print(allWithSquares); // [1, 1, 2, 4, 3, 9, 4, 16, 5, 25]

  
  // not using if without curly braces
  
  List<int> intList = [1, 2, 3];

  List<int> newList = [
    for (var x in intList) ...[x, x * 10, x * x],
  ];

  print(newList); // [1, 10, 1, 2, 20, 4, 3, 30, 9]


  // using functions, similar to Python multiple lambda list comprehension

  List<int> intLst = [1, 2, 3];
  int Function(int) f1 = (x) => x;
  int Function(int) f2 = (x) => x * 10;
  
  // using for loops
  List<int> newLst = [
    for (var x in intLst)
      for (var f in [f1, f2]) f(x),
  ];

  print(newLst); // [1, 10, 2, 20, 3, 30]
  
  // using List expand
  newLst = intLst.expand((v) => [f1(v), f2(v)]).toList();

  print(newLst); // [1, 10, 2, 20, 3, 30]
}
