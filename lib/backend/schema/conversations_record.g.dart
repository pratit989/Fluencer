// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConversationsRecord> _$conversationsRecordSerializer =
    new _$ConversationsRecordSerializer();

class _$ConversationsRecordSerializer
    implements StructuredSerializer<ConversationsRecord> {
  @override
  final Iterable<Type> types = const [
    ConversationsRecord,
    _$ConversationsRecord
  ];
  @override
  final String wireName = 'ConversationsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConversationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.user1;
    if (value != null) {
      result
        ..add('user_1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.user2;
    if (value != null) {
      result
        ..add('user_2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  ConversationsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user_1':
          result.user1 = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'user_2':
          result.user2 = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$ConversationsRecord extends ConversationsRecord {
  @override
  final DocumentReference<Object> user1;
  @override
  final DocumentReference<Object> user2;
  @override
  final DocumentReference<Object> reference;

  factory _$ConversationsRecord(
          [void Function(ConversationsRecordBuilder) updates]) =>
      (new ConversationsRecordBuilder()..update(updates)).build();

  _$ConversationsRecord._({this.user1, this.user2, this.reference}) : super._();

  @override
  ConversationsRecord rebuild(
          void Function(ConversationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationsRecordBuilder toBuilder() =>
      new ConversationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationsRecord &&
        user1 == other.user1 &&
        user2 == other.user2 &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, user1.hashCode), user2.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConversationsRecord')
          ..add('user1', user1)
          ..add('user2', user2)
          ..add('reference', reference))
        .toString();
  }
}

class ConversationsRecordBuilder
    implements Builder<ConversationsRecord, ConversationsRecordBuilder> {
  _$ConversationsRecord _$v;

  DocumentReference<Object> _user1;
  DocumentReference<Object> get user1 => _$this._user1;
  set user1(DocumentReference<Object> user1) => _$this._user1 = user1;

  DocumentReference<Object> _user2;
  DocumentReference<Object> get user2 => _$this._user2;
  set user2(DocumentReference<Object> user2) => _$this._user2 = user2;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ConversationsRecordBuilder() {
    ConversationsRecord._initializeBuilder(this);
  }

  ConversationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user1 = $v.user1;
      _user2 = $v.user2;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConversationsRecord;
  }

  @override
  void update(void Function(ConversationsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConversationsRecord build() {
    final _$result = _$v ??
        new _$ConversationsRecord._(
            user1: user1, user2: user2, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
