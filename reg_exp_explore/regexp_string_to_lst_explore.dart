void main() {
  const String timeStr1 = '10 3:30, 10:30';
  const String timeStr2 = '10 3:30 , 10:30';
  const String timeStr3 = '10 3:30, 10:30';
  const String timeStr4 = '10 3:30,10:30';

  convertToStrLst(timeStr1);
  convertToStrLst(timeStr2);
  convertToStrLst(timeStr3);
  convertToStrLst(timeStr4);
}

void convertToStrLst(String timeStr1) {
  RegExp regExp = RegExp(r'[ ,]+');
  List<String> timeStrLst = timeStr1.split(regExp);
  
  print(timeStrLst);
}
