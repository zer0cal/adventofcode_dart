import 'package:main/day1.dart' as day1;
import 'package:test/test.dart';

void main() {
  test('day1', () {
    expect(day1.whatFlor("(())"), 0);
    expect(day1.whatFlor("(()(()("), 3);
    expect(day1.whatFlor("))((((("), 3);
    expect(day1.whatFlor("())"), -1);
    expect(day1.whatFlor(")())())"), -3);
  });
}
