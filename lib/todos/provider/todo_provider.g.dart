// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosHash() => r'5317efca6b1c7f12900ca0bab80c70860447f01e';

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

abstract class _$Todos extends BuildlessAutoDisposeAsyncNotifier<List<Todo>> {
  late final int limit;
  late final int offset;

  FutureOr<List<Todo>> build({
    required int limit,
    required int offset,
  });
}

/// See also [Todos].
@ProviderFor(Todos)
const todosProvider = TodosFamily();

/// See also [Todos].
class TodosFamily extends Family<AsyncValue<List<Todo>>> {
  /// See also [Todos].
  const TodosFamily();

  /// See also [Todos].
  TodosProvider call({
    required int limit,
    required int offset,
  }) {
    return TodosProvider(
      limit: limit,
      offset: offset,
    );
  }

  @override
  TodosProvider getProviderOverride(
    covariant TodosProvider provider,
  ) {
    return call(
      limit: provider.limit,
      offset: provider.offset,
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
  String? get name => r'todosProvider';
}

/// See also [Todos].
class TodosProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Todos, List<Todo>> {
  /// See also [Todos].
  TodosProvider({
    required int limit,
    required int offset,
  }) : this._internal(
          () => Todos()
            ..limit = limit
            ..offset = offset,
          from: todosProvider,
          name: r'todosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$todosHash,
          dependencies: TodosFamily._dependencies,
          allTransitiveDependencies: TodosFamily._allTransitiveDependencies,
          limit: limit,
          offset: offset,
        );

  TodosProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.offset,
  }) : super.internal();

  final int limit;
  final int offset;

  @override
  FutureOr<List<Todo>> runNotifierBuild(
    covariant Todos notifier,
  ) {
    return notifier.build(
      limit: limit,
      offset: offset,
    );
  }

  @override
  Override overrideWith(Todos Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodosProvider._internal(
        () => create()
          ..limit = limit
          ..offset = offset,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        offset: offset,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Todos, List<Todo>> createElement() {
    return _TodosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodosProvider &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TodosRef on AutoDisposeAsyncNotifierProviderRef<List<Todo>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `offset` of this provider.
  int get offset;
}

class _TodosProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Todos, List<Todo>>
    with TodosRef {
  _TodosProviderElement(super.provider);

  @override
  int get limit => (origin as TodosProvider).limit;
  @override
  int get offset => (origin as TodosProvider).offset;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
