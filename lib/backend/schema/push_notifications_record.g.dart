// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notifications_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PushNotificationsRecord> _$pushNotificationsRecordSerializer =
    new _$PushNotificationsRecordSerializer();

class _$PushNotificationsRecordSerializer
    implements StructuredSerializer<PushNotificationsRecord> {
  @override
  final Iterable<Type> types = const [
    PushNotificationsRecord,
    _$PushNotificationsRecord
  ];
  @override
  final String wireName = 'PushNotificationsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PushNotificationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.notificationImageUrl;
    if (value != null) {
      result
        ..add('notification_image_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notificationSound;
    if (value != null) {
      result
        ..add('notification_sound')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notificationText;
    if (value != null) {
      result
        ..add('notification_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notificationTitle;
    if (value != null) {
      result
        ..add('notification_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sender;
    if (value != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRefs;
    if (value != null) {
      result
        ..add('user_refs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
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
  PushNotificationsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PushNotificationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'notification_image_url':
          result.notificationImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notification_sound':
          result.notificationSound = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notification_text':
          result.notificationText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notification_title':
          result.notificationTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sender':
          result.sender = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'user_refs':
          result.userRefs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
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

class _$PushNotificationsRecord extends PushNotificationsRecord {
  @override
  final String notificationImageUrl;
  @override
  final String notificationSound;
  @override
  final String notificationText;
  @override
  final String notificationTitle;
  @override
  final DocumentReference<Object> sender;
  @override
  final DateTime timestamp;
  @override
  final BuiltList<DocumentReference<Object>> userRefs;
  @override
  final DocumentReference<Object> reference;

  factory _$PushNotificationsRecord(
          [void Function(PushNotificationsRecordBuilder) updates]) =>
      (new PushNotificationsRecordBuilder()..update(updates)).build();

  _$PushNotificationsRecord._(
      {this.notificationImageUrl,
      this.notificationSound,
      this.notificationText,
      this.notificationTitle,
      this.sender,
      this.timestamp,
      this.userRefs,
      this.reference})
      : super._();

  @override
  PushNotificationsRecord rebuild(
          void Function(PushNotificationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PushNotificationsRecordBuilder toBuilder() =>
      new PushNotificationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PushNotificationsRecord &&
        notificationImageUrl == other.notificationImageUrl &&
        notificationSound == other.notificationSound &&
        notificationText == other.notificationText &&
        notificationTitle == other.notificationTitle &&
        sender == other.sender &&
        timestamp == other.timestamp &&
        userRefs == other.userRefs &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, notificationImageUrl.hashCode),
                                notificationSound.hashCode),
                            notificationText.hashCode),
                        notificationTitle.hashCode),
                    sender.hashCode),
                timestamp.hashCode),
            userRefs.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PushNotificationsRecord')
          ..add('notificationImageUrl', notificationImageUrl)
          ..add('notificationSound', notificationSound)
          ..add('notificationText', notificationText)
          ..add('notificationTitle', notificationTitle)
          ..add('sender', sender)
          ..add('timestamp', timestamp)
          ..add('userRefs', userRefs)
          ..add('reference', reference))
        .toString();
  }
}

class PushNotificationsRecordBuilder
    implements
        Builder<PushNotificationsRecord, PushNotificationsRecordBuilder> {
  _$PushNotificationsRecord _$v;

  String _notificationImageUrl;
  String get notificationImageUrl => _$this._notificationImageUrl;
  set notificationImageUrl(String notificationImageUrl) =>
      _$this._notificationImageUrl = notificationImageUrl;

  String _notificationSound;
  String get notificationSound => _$this._notificationSound;
  set notificationSound(String notificationSound) =>
      _$this._notificationSound = notificationSound;

  String _notificationText;
  String get notificationText => _$this._notificationText;
  set notificationText(String notificationText) =>
      _$this._notificationText = notificationText;

  String _notificationTitle;
  String get notificationTitle => _$this._notificationTitle;
  set notificationTitle(String notificationTitle) =>
      _$this._notificationTitle = notificationTitle;

  DocumentReference<Object> _sender;
  DocumentReference<Object> get sender => _$this._sender;
  set sender(DocumentReference<Object> sender) => _$this._sender = sender;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  ListBuilder<DocumentReference<Object>> _userRefs;
  ListBuilder<DocumentReference<Object>> get userRefs =>
      _$this._userRefs ??= new ListBuilder<DocumentReference<Object>>();
  set userRefs(ListBuilder<DocumentReference<Object>> userRefs) =>
      _$this._userRefs = userRefs;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PushNotificationsRecordBuilder() {
    PushNotificationsRecord._initializeBuilder(this);
  }

  PushNotificationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notificationImageUrl = $v.notificationImageUrl;
      _notificationSound = $v.notificationSound;
      _notificationText = $v.notificationText;
      _notificationTitle = $v.notificationTitle;
      _sender = $v.sender;
      _timestamp = $v.timestamp;
      _userRefs = $v.userRefs?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PushNotificationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PushNotificationsRecord;
  }

  @override
  void update(void Function(PushNotificationsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PushNotificationsRecord build() {
    _$PushNotificationsRecord _$result;
    try {
      _$result = _$v ??
          new _$PushNotificationsRecord._(
              notificationImageUrl: notificationImageUrl,
              notificationSound: notificationSound,
              notificationText: notificationText,
              notificationTitle: notificationTitle,
              sender: sender,
              timestamp: timestamp,
              userRefs: _userRefs?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userRefs';
        _userRefs?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PushNotificationsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
