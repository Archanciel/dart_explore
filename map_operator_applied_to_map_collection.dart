void main() {
  Map<String, int> srcMap = {"a": 1, "b": 2};
  print(srcMap); // {a: 1, b: 2}

  Map<String, int> targetMap = srcMap.map((k, v) {
    k = k + k;
    v = v * 10;

    return MapEntry(k, v);
  });

  print(targetMap); // {aa: 10, bb: 20}

  print(srcMap); // {a: 1, b: 2}

  List<dynamic> ll = ['hello', 12, 2.34, true];

  for (var value in ll) {
    if (value is String || value is int) {
      print(value);
    }
  }
}
