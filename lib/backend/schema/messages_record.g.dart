// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessagesRecord> _$messagesRecordSerializer =
    new _$MessagesRecordSerializer();

class _$MessagesRecordSerializer
    implements StructuredSerializer<MessagesRecord> {
  @override
  final Iterable<Type> types = const [MessagesRecord, _$MessagesRecord];
  @override
  final String wireName = 'MessagesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MessagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.messageTime;
    if (value != null) {
      result
        ..add('message_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.messageText;
    if (value != null) {
      result
        ..add('message_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.messageType;
    if (value != null) {
      result
        ..add('message_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postRef;
    if (value != null) {
      result
        ..add('post_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.fromUserRef;
    if (value != null) {
      result
        ..add('from_user_ref')
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
  MessagesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'message_time':
          result.messageTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'message_text':
          result.messageText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message_type':
          result.messageType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'post_ref':
          result.postRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'from_user_ref':
          result.fromUserRef = serializers.deserialize(value,
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

class _$MessagesRecord extends MessagesRecord {
  @override
  final DateTime messageTime;
  @override
  final String messageText;
  @override
  final String messageType;
  @override
  final DocumentReference<Object> postRef;
  @override
  final DocumentReference<Object> fromUserRef;
  @override
  final DocumentReference<Object> reference;

  factory _$MessagesRecord([void Function(MessagesRecordBuilder) updates]) =>
      (new MessagesRecordBuilder()..update(updates)).build();

  _$MessagesRecord._(
      {this.messageTime,
      this.messageText,
      this.messageType,
      this.postRef,
      this.fromUserRef,
      this.reference})
      : super._();

  @override
  MessagesRecord rebuild(void Function(MessagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesRecordBuilder toBuilder() =>
      new MessagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagesRecord &&
        messageTime == other.messageTime &&
        messageText == other.messageText &&
        messageType == other.messageType &&
        postRef == other.postRef &&
        fromUserRef == other.fromUserRef &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, messageTime.hashCode), messageText.hashCode),
                    messageType.hashCode),
                postRef.hashCode),
            fromUserRef.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessagesRecord')
          ..add('messageTime', messageTime)
          ..add('messageText', messageText)
          ..add('messageType', messageType)
          ..add('postRef', postRef)
          ..add('fromUserRef', fromUserRef)
          ..add('reference', reference))
        .toString();
  }
}

class MessagesRecordBuilder
    implements Builder<MessagesRecord, MessagesRecordBuilder> {
  _$MessagesRecord _$v;

  DateTime _messageTime;
  DateTime get messageTime => _$this._messageTime;
  set messageTime(DateTime messageTime) => _$this._messageTime = messageTime;

  String _messageText;
  String get messageText => _$this._messageText;
  set messageText(String messageText) => _$this._messageText = messageText;

  String _messageType;
  String get messageType => _$this._messageType;
  set messageType(String messageType) => _$this._messageType = messageType;

  DocumentReference<Object> _postRef;
  DocumentReference<Object> get postRef => _$this._postRef;
  set postRef(DocumentReference<Object> postRef) => _$this._postRef = postRef;

  DocumentReference<Object> _fromUserRef;
  DocumentReference<Object> get fromUserRef => _$this._fromUserRef;
  set fromUserRef(DocumentReference<Object> fromUserRef) =>
      _$this._fromUserRef = fromUserRef;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MessagesRecordBuilder() {
    MessagesRecord._initializeBuilder(this);
  }

  MessagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _messageTime = $v.messageTime;
      _messageText = $v.messageText;
      _messageType = $v.messageType;
      _postRef = $v.postRef;
      _fromUserRef = $v.fromUserRef;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessagesRecord;
  }

  @override
  void update(void Function(MessagesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessagesRecord build() {
    final _$result = _$v ??
        new _$MessagesRecord._(
            messageTime: messageTime,
            messageText: messageText,
            messageType: messageType,
            postRef: postRef,
            fromUserRef: fromUserRef,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
