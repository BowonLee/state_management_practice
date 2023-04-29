import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CustomProviderObserver extends ProviderObserver {
  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    Logger().i("${provider.name} is disposed : ${provider.runtimeType}");
    super.didDisposeProvider(provider, container);
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    Logger().i("${provider.name} is add : ${provider.runtimeType} , $value ");
    super.didAddProvider(provider, value, container);
  }

  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    Logger().i("${provider.name} is update : $newValue");
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
