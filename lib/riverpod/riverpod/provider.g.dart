// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$valueNotifierHash() => r'302c2ee8dc132139311cf26ac123af837a6b8a69';

/// See also [ValueNotifier].
@ProviderFor(ValueNotifier)
final valueNotifierProvider =
    AutoDisposeNotifierProvider<ValueNotifier, int>.internal(
  ValueNotifier.new,
  name: r'valueNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$valueNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ValueNotifier = AutoDisposeNotifier<int>;
String _$noneValueNotifierHash() => r'f26b13cb5f935129aded805982c7aedc592e2b53';

/// See also [NoneValueNotifier].
@ProviderFor(NoneValueNotifier)
final noneValueNotifierProvider =
    AutoDisposeNotifierProvider<NoneValueNotifier, dynamic>.internal(
  NoneValueNotifier.new,
  name: r'noneValueNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$noneValueNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NoneValueNotifier = AutoDisposeNotifier<dynamic>;
String _$futureNotifierHash() => r'428e0af86f9935ce2f36bfcca66aaeedd81e09ec';

/// See also [FutureNotifier].
@ProviderFor(FutureNotifier)
final futureNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FutureNotifier, int>.internal(
  FutureNotifier.new,
  name: r'futureNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$futureNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FutureNotifier = AutoDisposeAsyncNotifier<int>;
String _$asyncStateNotifierHash() =>
    r'2f51b3d7507a14139ea2bdcf50ab377ca8840a29';

/// See also [AsyncStateNotifier].
@ProviderFor(AsyncStateNotifier)
final asyncStateNotifierProvider = AutoDisposeAsyncNotifierProvider<
    AsyncStateNotifier, BaseSampleState>.internal(
  AsyncStateNotifier.new,
  name: r'asyncStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$asyncStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncStateNotifier = AutoDisposeAsyncNotifier<BaseSampleState>;
String _$singleValueHash() => r'689092d17dce60a7fc8e0f5452e74ec5d0af8324';

/// See also [singleValue].
@ProviderFor(singleValue)
final singleValueProvider = AutoDisposeProvider<String>.internal(
  singleValue,
  name: r'singleValueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$singleValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SingleValueRef = AutoDisposeProviderRef<String>;
String _$singleValueWithParamHash() =>
    r'033acc2e330b3ca4399232a53a5b76764e88a5b3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef SingleValueWithParamRef = AutoDisposeProviderRef<String>;

/// See also [singleValueWithParam].
@ProviderFor(singleValueWithParam)
const singleValueWithParamProvider = SingleValueWithParamFamily();

/// See also [singleValueWithParam].
class SingleValueWithParamFamily extends Family<String> {
  /// See also [singleValueWithParam].
  const SingleValueWithParamFamily();

  /// See also [singleValueWithParam].
  SingleValueWithParamProvider call({
    required int param,
  }) {
    return SingleValueWithParamProvider(
      param: param,
    );
  }

  @override
  SingleValueWithParamProvider getProviderOverride(
    covariant SingleValueWithParamProvider provider,
  ) {
    return call(
      param: provider.param,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'singleValueWithParamProvider';
}

/// See also [singleValueWithParam].
class SingleValueWithParamProvider extends AutoDisposeProvider<String> {
  /// See also [singleValueWithParam].
  SingleValueWithParamProvider({
    required this.param,
  }) : super.internal(
          (ref) => singleValueWithParam(
            ref,
            param: param,
          ),
          from: singleValueWithParamProvider,
          name: r'singleValueWithParamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleValueWithParamHash,
          dependencies: SingleValueWithParamFamily._dependencies,
          allTransitiveDependencies:
              SingleValueWithParamFamily._allTransitiveDependencies,
        );

  final int param;

  @override
  bool operator ==(Object other) {
    return other is SingleValueWithParamProvider && other.param == param;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, param.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$futureValueHash() => r'085d9093bd952a5cc5d11b3fcb1f5a514d1e7fa1';

/// See also [futureValue].
@ProviderFor(futureValue)
final futureValueProvider = AutoDisposeFutureProvider<String>.internal(
  futureValue,
  name: r'futureValueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$futureValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FutureValueRef = AutoDisposeFutureProviderRef<String>;
String _$streamValueHash() => r'aa12ac9e9a013e8dd147d8477631f7e63dd59ed2';

/// See also [streamValue].
@ProviderFor(streamValue)
final streamValueProvider = AutoDisposeProvider<Stream<int>>.internal(
  streamValue,
  name: r'streamValueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$streamValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamValueRef = AutoDisposeProviderRef<Stream<int>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
