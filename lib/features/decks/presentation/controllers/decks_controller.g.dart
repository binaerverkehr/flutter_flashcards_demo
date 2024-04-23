// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decks_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$decksControllerHash() => r'ca19b3690e5228c201a90f07283278984e3cf809';

/// See also [decksController].
@ProviderFor(decksController)
final decksControllerProvider = AutoDisposeProvider<DecksController>.internal(
  decksController,
  name: r'decksControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$decksControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DecksControllerRef = AutoDisposeProviderRef<DecksController>;
String _$decksStreamHash() => r'8364487bee72e0a1a73663dfcf20c8468101a357';

/// See also [decksStream].
@ProviderFor(decksStream)
final decksStreamProvider =
    AutoDisposeStreamProvider<List<DeckEntity>>.internal(
  decksStream,
  name: r'decksStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$decksStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DecksStreamRef = AutoDisposeStreamProviderRef<List<DeckEntity>>;
String _$addDeckHash() => r'4eaee22dd66db38e49ac84eeee93ae5b4f4cfdb0';

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

/// See also [addDeck].
@ProviderFor(addDeck)
const addDeckProvider = AddDeckFamily();

/// See also [addDeck].
class AddDeckFamily extends Family<AsyncValue<void>> {
  /// See also [addDeck].
  const AddDeckFamily();

  /// See also [addDeck].
  AddDeckProvider call(
    DeckEntity deck,
  ) {
    return AddDeckProvider(
      deck,
    );
  }

  @override
  AddDeckProvider getProviderOverride(
    covariant AddDeckProvider provider,
  ) {
    return call(
      provider.deck,
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
  String? get name => r'addDeckProvider';
}

/// See also [addDeck].
class AddDeckProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addDeck].
  AddDeckProvider(
    DeckEntity deck,
  ) : this._internal(
          (ref) => addDeck(
            ref as AddDeckRef,
            deck,
          ),
          from: addDeckProvider,
          name: r'addDeckProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addDeckHash,
          dependencies: AddDeckFamily._dependencies,
          allTransitiveDependencies: AddDeckFamily._allTransitiveDependencies,
          deck: deck,
        );

  AddDeckProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.deck,
  }) : super.internal();

  final DeckEntity deck;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddDeckRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddDeckProvider._internal(
        (ref) => create(ref as AddDeckRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        deck: deck,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddDeckProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddDeckProvider && other.deck == deck;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deck.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddDeckRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `deck` of this provider.
  DeckEntity get deck;
}

class _AddDeckProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddDeckRef {
  _AddDeckProviderElement(super.provider);

  @override
  DeckEntity get deck => (origin as AddDeckProvider).deck;
}

String _$updateDeckHash() => r'32175e13ae2efc9e6528464300285ef133cb3214';

/// See also [updateDeck].
@ProviderFor(updateDeck)
const updateDeckProvider = UpdateDeckFamily();

/// See also [updateDeck].
class UpdateDeckFamily extends Family<AsyncValue<void>> {
  /// See also [updateDeck].
  const UpdateDeckFamily();

  /// See also [updateDeck].
  UpdateDeckProvider call(
    DeckEntity updatedDeck,
  ) {
    return UpdateDeckProvider(
      updatedDeck,
    );
  }

  @override
  UpdateDeckProvider getProviderOverride(
    covariant UpdateDeckProvider provider,
  ) {
    return call(
      provider.updatedDeck,
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
  String? get name => r'updateDeckProvider';
}

/// See also [updateDeck].
class UpdateDeckProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateDeck].
  UpdateDeckProvider(
    DeckEntity updatedDeck,
  ) : this._internal(
          (ref) => updateDeck(
            ref as UpdateDeckRef,
            updatedDeck,
          ),
          from: updateDeckProvider,
          name: r'updateDeckProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateDeckHash,
          dependencies: UpdateDeckFamily._dependencies,
          allTransitiveDependencies:
              UpdateDeckFamily._allTransitiveDependencies,
          updatedDeck: updatedDeck,
        );

  UpdateDeckProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.updatedDeck,
  }) : super.internal();

  final DeckEntity updatedDeck;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateDeckRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateDeckProvider._internal(
        (ref) => create(ref as UpdateDeckRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        updatedDeck: updatedDeck,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateDeckProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateDeckProvider && other.updatedDeck == updatedDeck;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, updatedDeck.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateDeckRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `updatedDeck` of this provider.
  DeckEntity get updatedDeck;
}

class _UpdateDeckProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpdateDeckRef {
  _UpdateDeckProviderElement(super.provider);

  @override
  DeckEntity get updatedDeck => (origin as UpdateDeckProvider).updatedDeck;
}

String _$deleteDeckByIdHash() => r'63d8dc93fa996881eafb96cc05a7031fb5caf6c0';

/// See also [deleteDeckById].
@ProviderFor(deleteDeckById)
const deleteDeckByIdProvider = DeleteDeckByIdFamily();

/// See also [deleteDeckById].
class DeleteDeckByIdFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteDeckById].
  const DeleteDeckByIdFamily();

  /// See also [deleteDeckById].
  DeleteDeckByIdProvider call(
    int deckId,
  ) {
    return DeleteDeckByIdProvider(
      deckId,
    );
  }

  @override
  DeleteDeckByIdProvider getProviderOverride(
    covariant DeleteDeckByIdProvider provider,
  ) {
    return call(
      provider.deckId,
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
  String? get name => r'deleteDeckByIdProvider';
}

/// See also [deleteDeckById].
class DeleteDeckByIdProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteDeckById].
  DeleteDeckByIdProvider(
    int deckId,
  ) : this._internal(
          (ref) => deleteDeckById(
            ref as DeleteDeckByIdRef,
            deckId,
          ),
          from: deleteDeckByIdProvider,
          name: r'deleteDeckByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteDeckByIdHash,
          dependencies: DeleteDeckByIdFamily._dependencies,
          allTransitiveDependencies:
              DeleteDeckByIdFamily._allTransitiveDependencies,
          deckId: deckId,
        );

  DeleteDeckByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.deckId,
  }) : super.internal();

  final int deckId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteDeckByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteDeckByIdProvider._internal(
        (ref) => create(ref as DeleteDeckByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        deckId: deckId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteDeckByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteDeckByIdProvider && other.deckId == deckId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deckId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteDeckByIdRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `deckId` of this provider.
  int get deckId;
}

class _DeleteDeckByIdProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteDeckByIdRef {
  _DeleteDeckByIdProviderElement(super.provider);

  @override
  int get deckId => (origin as DeleteDeckByIdProvider).deckId;
}

String _$getDeckByIdHash() => r'4f29cad750d213a4344c7c91a17fc67b2c18ed73';

/// See also [getDeckById].
@ProviderFor(getDeckById)
const getDeckByIdProvider = GetDeckByIdFamily();

/// See also [getDeckById].
class GetDeckByIdFamily extends Family<AsyncValue<DeckEntity?>> {
  /// See also [getDeckById].
  const GetDeckByIdFamily();

  /// See also [getDeckById].
  GetDeckByIdProvider call(
    int deckId,
  ) {
    return GetDeckByIdProvider(
      deckId,
    );
  }

  @override
  GetDeckByIdProvider getProviderOverride(
    covariant GetDeckByIdProvider provider,
  ) {
    return call(
      provider.deckId,
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
  String? get name => r'getDeckByIdProvider';
}

/// See also [getDeckById].
class GetDeckByIdProvider extends AutoDisposeFutureProvider<DeckEntity?> {
  /// See also [getDeckById].
  GetDeckByIdProvider(
    int deckId,
  ) : this._internal(
          (ref) => getDeckById(
            ref as GetDeckByIdRef,
            deckId,
          ),
          from: getDeckByIdProvider,
          name: r'getDeckByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDeckByIdHash,
          dependencies: GetDeckByIdFamily._dependencies,
          allTransitiveDependencies:
              GetDeckByIdFamily._allTransitiveDependencies,
          deckId: deckId,
        );

  GetDeckByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.deckId,
  }) : super.internal();

  final int deckId;

  @override
  Override overrideWith(
    FutureOr<DeckEntity?> Function(GetDeckByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDeckByIdProvider._internal(
        (ref) => create(ref as GetDeckByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        deckId: deckId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DeckEntity?> createElement() {
    return _GetDeckByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDeckByIdProvider && other.deckId == deckId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deckId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDeckByIdRef on AutoDisposeFutureProviderRef<DeckEntity?> {
  /// The parameter `deckId` of this provider.
  int get deckId;
}

class _GetDeckByIdProviderElement
    extends AutoDisposeFutureProviderElement<DeckEntity?> with GetDeckByIdRef {
  _GetDeckByIdProviderElement(super.provider);

  @override
  int get deckId => (origin as GetDeckByIdProvider).deckId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
