// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_refs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConversationRefsRecord> _$conversationRefsRecordSerializer =
    new _$ConversationRefsRecordSerializer();

class _$ConversationRefsRecordSerializer
    implements StructuredSerializer<ConversationRefsRecord> {
  @override
  final Iterable<Type> types = const [
    ConversationRefsRecord,
    _$ConversationRefsRecord
  ];
  @override
  final String wireName = 'ConversationRefsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConversationRefsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.conversationRef;
    if (value != null) {
      result
        ..add('conversation_ref')
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
  ConversationRefsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversationRefsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'conversation_ref':
          result.conversationRef = serializers.deserialize(value,
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

class _$ConversationRefsRecord extends ConversationRefsRecord {
  @override
  final DocumentReference<Object> userRef;
  @override
  final DocumentReference<Object> conversationRef;
  @override
  final DocumentReference<Object> reference;

  factory _$ConversationRefsRecord(
          [void Function(ConversationRefsRecordBuilder) updates]) =>
      (new ConversationRefsRecordBuilder()..update(updates)).build();

  _$ConversationRefsRecord._(
      {this.userRef, this.conversationRef, this.reference})
      : super._();

  @override
  ConversationRefsRecord rebuild(
          void Function(ConversationRefsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationRefsRecordBuilder toBuilder() =>
      new ConversationRefsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationRefsRecord &&
        userRef == other.userRef &&
        conversationRef == other.conversationRef &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, userRef.hashCode), conversationRef.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConversationRefsRecord')
          ..add('userRef', userRef)
          ..add('conversationRef', conversationRef)
          ..add('reference', reference))
        .toString();
  }
}

class ConversationRefsRecordBuilder
    implements Builder<ConversationRefsRecord, ConversationRefsRecordBuilder> {
  _$ConversationRefsRecord _$v;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DocumentReference<Object> _conversationRef;
  DocumentReference<Object> get conversationRef => _$this._conversationRef;
  set conversationRef(DocumentReference<Object> conversationRef) =>
      _$this._conversationRef = conversationRef;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ConversationRefsRecordBuilder() {
    ConversationRefsRecord._initializeBuilder(this);
  }

  ConversationRefsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _conversationRef = $v.conversationRef;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationRefsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConversationRefsRecord;
  }

  @override
  void update(void Function(ConversationRefsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConversationRefsRecord build() {
    final _$result = _$v ??
        new _$ConversationRefsRecord._(
            userRef: userRef,
            conversationRef: conversationRef,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
