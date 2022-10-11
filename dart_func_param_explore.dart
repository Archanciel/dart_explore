void main() {
  runPositionalParmsFunc(funcPositionalParms);
  runRequiredNamedParmsFunc(funcRequiredNamedParms);
  runOptionalNamedParmsFunc(funcOptionalNamedParms);
}

void runPositionalParmsFunc(void Function(String, int) positionalParmFunc) {
  positionalParmFunc('hello', 3);
}

void funcPositionalParms(String str, int number) {
  String printStr = 'funcPositionalParms';

  for (int i = 0; i < number; i++) {
    printStr = '$printStr, $str';
  }

  print(printStr);
}

void runRequiredNamedParmsFunc(
    void Function({required String str, required int number})
        requiredParmFunc) {
  requiredParmFunc(str: 'hello', number: 3);
}

void funcRequiredNamedParms({required String str, required int number}) {
  String printStr = 'funcRequiredNamedParms';

  for (int i = 0; i < number; i++) {
    printStr = '$printStr, $str';
  }

  print(printStr);
}

void runOptionalNamedParmsFunc(
    void Function({String? str}) optionalParmFunc) {
  optionalParmFunc(str: 'hello');
}

void funcOptionalNamedParms({String? str, int number = 4}) {
  String printStr = 'funcOptionalNamedParms';

  for (int i = 0; i < number; i++) {
    printStr = '$printStr, $str';
  }

  print(printStr);
}
