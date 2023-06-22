class ImplementedClass {
  String handleStringTransformation(String str) {
    String transformedStr = transformString(str);

    // add space between each character
    transformedStr = transformedStr.split('').join(' ');
    return transformedStr;
  }

  String transformString(String str) {
    return str.toUpperCase();
  }
}

class ImplementingClass implements ImplementedClass {
  @override
  String handleStringTransformation(String str) {
    ImplementedClass implementedClass = ImplementedClass();
    String transformedStr = implementedClass.handleStringTransformation(str);

    return transformedStr;
  }

  @override
  String transformString(String str) {
    return str.toLowerCase();
  }
}

class InterfaceClass {
  void notifyListners(String str) {
    print('notifyListners: $str');
  }
}

class ParentClass implements InterfaceClass {
  String handleStringTransformation(String str) {
    String transformedStr = transformString(str);

    // add space between each character
    transformedStr = transformedStr.split('').join(' ');

    notifyListners(transformedStr);

    return transformedStr;
  }

  String transformString(String str) {
    return str.toUpperCase();
  }

  @override
  void notifyListners(String str) {
    print('notifyListners: $str');
  }
}

class SubClass extends ParentClass {
  @override
  String handleStringTransformation(String str) {
    String transformedStr = super.handleStringTransformation(str);

    return transformedStr;
  }

  @override
  String transformString(String str) {
    return str.toLowerCase();
  }
}

void main() {
  ImplementingClass implementingClass = ImplementingClass();
  String transformedStr =
      implementingClass.handleStringTransformation('hello WORLD');
  print(transformedStr);

  print('---------------------------------------');

  SubClass subClass = SubClass();
  transformedStr = subClass.handleStringTransformation('hello WORLD');
  print(transformedStr);

  // Sub class can be used as InterfaceClass since its parent class
  // implements InterfaceClass
  InterfaceClass interfaceClass = subClass;
  interfaceClass.notifyListners('hello WORLD');
}
