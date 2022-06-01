import 'dart:math';

void main() {
  bool isPositive = Random().nextBool();
  bool isNegative = Random().nextBool();

  List<int> intLst = [
    1,
    if (isPositive)
      2
    else
      -2, // if (isPositive) {2} else {-2} causes compile error
    (isNegative) ? -3 : 3,
  ];

  // if else without curly braces legal but not advised
  if (isPositive)
    print(intLst);
  else
    print(intLst.reversed);
}
