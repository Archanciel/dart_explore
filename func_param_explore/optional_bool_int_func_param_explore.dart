void main() {
  execFuncPassedAsParamOneParm(funcOneParam);
  execFuncPassedAsParamAllParm(funcAllParam);

  execFuncPassedAsParamOneParm(funcAllParam);
  execFuncPassedAsParamAllParm(funcOneParam);
}

void execFuncPassedAsParamOneParm(
    void Function([ 
      String optStr,
      int optSign,
      bool optBool,
    ]) funcPassedAsParam) {
  funcPassedAsParam('hello');
}

void execFuncPassedAsParamAllParm(
    void Function([
      String optStr,
      int optSign,
      bool optBool,
    ]) funcPassedAsParam) {
  funcPassedAsParam(
    'hello',
    -1,
    true,
  );
}

/// This function is passed as a parameter to another function. Its
/// parameters are all optional but must be declared with a nullable
/// (?) type.
void funcOneParam([
  String? optStr,
  int? _,
  bool? __,
]) {
  String printStr = 'funcOneParam';

  if (optStr != null) {
    printStr = '$printStr, $optStr';
  }

  print(printStr);
}

/// This function is passed as a parameter to another function. Its
/// parameters are all optional but must be declared with a nullable
/// (?) type.
void funcAllParam([
  String? optStr,
  int? optSign,
  bool? optBool,
]) {
  String printStr = 'funcAllParam';

  if (optStr != null) {
    printStr = '$printStr, $optStr';
  }

  if (optSign != null) {
    printStr = '$printStr, $optSign';
  }

  if (optBool != null) {
    printStr = '$printStr, $optBool';
  }

  print(printStr);
}
