void main() {
  void Function(String, int) positionalParmsFuncVariable = positionalParmsFunc;
  runPositionalParmsFunc(positionalParmsFuncVariable);

  void Function({required String str, required int number})
      requiredNamedParmsFuncVariable = requiredNamedParmsFunc;
  runRequiredNamedParmsFunc(requiredNamedParmsFuncVariable);

  void Function({String? str}) optionalNamedParmsFuncVariable =
      optionalNamedParmsFunc;
  runOptionalNamedParmsFunc(optionalNamedParmsFuncVariable);

  // Error: The argument type 'void Function({int number, String? optionalStr})'
  // can't be assigned to the parameter type 'void Function({String? str})'.
  // runOptionalNamedParmsFunc(funcOptionalDifferentlyNamedParms);

  // Error: A value of type 'void Function({int number, String? optionalStr})'
  // can't be assigned to a variable of type 'void Function({String? str})'.
  //funcOptionalNamedParmsVariable = funcOptionalDifferentlyNamedParms;

  // Using positional arguments instead of named arguments solves the
  // problem of similar functions with different argument names !
  
  void Function(double)
      positionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFuncVariable =
      positionalNonNullableAndPositionalOptionalNullableNoDefValArguments;
  runPositionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFunc(
      positionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFuncVariable);

  positionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFuncVariable =
      positionalNonNullableAndPositionalOptionalNullableNoDefValDiffNamedArguments;
  runPositionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFunc(
      positionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFuncVariable);
}

void runPositionalParmsFunc(void Function(String, int) positionalParmFunc) {
  positionalParmFunc('hello', 3);
}

void positionalParmsFunc(String str, int number) {
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

void requiredNamedParmsFunc({required String str, required int number}) {
  String printStr = 'funcRequiredNamedParms';

  for (int i = 0; i < number; i++) {
    printStr = '$printStr, $str';
  }

  print(printStr);
}

void runOptionalNamedParmsFunc(void Function({String? str}) optionalParmFunc) {
  optionalParmFunc(str: 'hello');
}

void optionalNamedParmsFunc({String? str, int number = 4}) {
  String printStr = 'funcOptionalNamedParms';

  for (int i = 0; i < number; i++) {
    printStr = '$printStr, $str';
  }

  print(printStr);
}

void funcOptionalDifferentlyNamedParms({String? optionalStr, int number = 4}) {
  String printStr = 'funcOptionalNamedParms';

  for (int i = 0; i < number; i++) {
    printStr = '$printStr, $optionalStr';
  }

  print(printStr);
}

void runPositionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFunc(
    void Function(double)
        positionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFunc) {
  positionalNonNullableAndPositionalOptionalNullableNoDefValArgumentsFunc(2.5);
}

void positionalNonNullableAndPositionalOptionalNullableNoDefValArguments(
    double percent,
    [int? one,
    double? two]) {
  // no default value arguments, compensated by using ?? null operator
  print('Result 2.5 % of 2: ${(percent / 100) * (one ?? 1) * (two ?? 2)}');
}

void
    positionalNonNullableAndPositionalOptionalNullableNoDefValDiffNamedArguments(
        double percentage,
        [int? optionalOne,
        double? optionalTwo]) {
  // no default value arguments, compensated by using ?? null operator
  print(
      'Result 2.5 percent of 2: ${(percentage / 100) * (optionalOne ?? 1) * (optionalTwo ?? 2)}');
}
