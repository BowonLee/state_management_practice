import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:state_management_practice/riverpod/riverpod/custom_exception.dart';
import 'package:state_management_practice/riverpod/riverpod/provider.dart';
import 'package:state_management_practice/riverpod/riverpod/provider_state.dart';
import 'package:state_management_practice/riverpod/riverpod/repository.dart';

import 'provider_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  group("simple test", () {
    int number = 0;

    setUp(() {
      number = 1;
    });

    test("number is 1 ", () {
      number++;
      expect(number, 2);
    });

    test("number is 1 ", () {
      expect(number, 1);
    });
  });

  group("provider test", () {
    final MockRepository mockRepository = MockRepository();
    final container = ProviderContainer();
    late SampleStateNotifier notifier;

    setUpAll(() {
      notifier = container.read(sampleStateNotifierProvider.notifier);
    });

    group("request is success", () {
      setUp(() {
        notifier = container.read(sampleStateNotifierProvider.notifier);
        // when(mockRepository.request()).thenAnswer((realInvocation) => Future(() => null));
      });
      test("init", () {
        expect(notifier.state, isA<SampleLoading>());
      });

      test("success", () async {
        const fakeCode = 100;
        when(mockRepository.request()).thenReturn(Future.value(fakeCode));
        expect(notifier.state, isA<SampleLoading>());
        await notifier.getData();
        verify(mockRepository.request());
        expect(
            notifier.state, isA<SampleSuccess>().having((state) => state.code, "code", fakeCode));
      });
    });

    group("request is exception", () {
      ProviderContainer container = ProviderContainer(
          overrides: [clientRepositoryProvider.overrideWithValue(mockRepository)]);
      when(mockRepository.request()).thenThrow(Exception());

      setUp(() {});
      test("request fail", () async {
        final sampleState = container.read(sampleStateNotifierProvider.notifier);

        expect(sampleState.state, isA<SampleLoading>());
        await sampleState.getData();

        expect(sampleState.state, isA<SampleError>());
      });

      test("request is error", () async {
        final sampleState = container.read(sampleStateNotifierProvider.notifier);

        expect(sampleState.state, isA<SampleLoading>());
        await sampleState.getData();
        expect(sampleState.state, isA<SampleError>());
      });
    });
  });
}
