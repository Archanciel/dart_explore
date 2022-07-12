enum MyEnum { minus, plus, two, three }

void main() {
  print(MyEnum.plus.index); // 1
  print(MyEnum.values[1]); // MyEnum.plus
  
  Map<String, dynamic> map = {'dur': -1};
  
  MyEnum val = (map['dur'] > 0) ? MyEnum.plus : MyEnum.minus;
  
  print(val);
}
