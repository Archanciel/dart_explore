import 'package:test/test.dart';
void main() {
  group("some_Group_Name 1", () {
    test("Description of the test 1", () {
      String actualValue = '';
      String matchingValue = '';
      expect(actualValue, matchingValue);
    });
    test("Description of the test 2", () {
      String actualValue = '';
      String matchingValue = '';
      expect(actualValue, matchingValue);
    });
  });

  group("some_Group_Name 2", () {
    test("Description of the test 1", () {
      String actualValue = '';
      String matchingValue = '';
      expect(actualValue, matchingValue);
    });
    test("Description of the test 2", () {
      String actualValue = '';
      String matchingValue = '';
      expect(actualValue, matchingValue);
    });
  });

  test("Description of the test 1", () {
    String actualValue = '';
    String matchingValue = '';
    expect(actualValue, matchingValue);
  });
}
