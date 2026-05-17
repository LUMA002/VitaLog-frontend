import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

base class TalkerRiverpodObserver extends ProviderObserver {
  const TalkerRiverpodObserver({required this.talker});

  final Talker talker;

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    talker.verbose(
      '[Riverpod] Provider added: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    talker.verbose(
      '[Riverpod] Provider disposed: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    talker.verbose(
      '[Riverpod] Provider updated: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    talker.handle(
      error,
      stackTrace,
      '[Riverpod] Provider failed: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }
}
