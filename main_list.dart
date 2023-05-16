List<int> modifyVarValueFunction(List<int> varLst) {
  return varLst.map((e) => e * 10).toList();
}

main(ArgumentError) {
  var one = 1;
  var two = 2;

  List<int> varLst = [one, two];

  print(varLst);
  varLst = modifyVarValueFunction(varLst);
  print(varLst);

  print(one);
  print(two);
}
