import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:state_management_practice/riverpod/riverpod/repository.dart';

import 'provider_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  group("simple test", () {
    int number = 0;

    setUp(() {
      number++;
    });

    test("number is 1 ", () {
      final testNumber = 1;

      expect(testNumber, 1);
    });

    test("number is 1 ", () {
      final testNumber = 1;

      expect(testNumber, 1);
    });
  });

  group("provider test", () {
    final MockRepository repository = MockRepository();

    group("errorHandle", () {});
  });
}
