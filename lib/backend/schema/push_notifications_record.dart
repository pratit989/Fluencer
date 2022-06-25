import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'push_notifications_record.g.dart';

abstract class PushNotificationsRecord
    implements Built<PushNotificationsRecord, PushNotificationsRecordBuilder> {
  static Serializer<PushNotificationsRecord> get serializer =>
      _$pushNotificationsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'notification_image_url')
  String get notificationImageUrl;

  @nullable
  @BuiltValueField(wireName: 'notification_sound')
  String get notificationSound;

  @nullable
  @BuiltValueField(wireName: 'notification_text')
  String get notificationText;

  @nullable
  @BuiltValueField(wireName: 'notification_title')
  String get notificationTitle;

  @nullable
  DocumentReference get sender;

  @nullable
  DateTime get timestamp;

  @nullable
  @BuiltValueField(wireName: 'user_refs')
  BuiltList<DocumentReference> get userRefs;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PushNotificationsRecordBuilder builder) =>
      builder
        ..notificationImageUrl = ''
        ..notificationSound = ''
        ..notificationText = ''
        ..notificationTitle = ''
        ..userRefs = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('push_notifications');

  static Stream<PushNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PushNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PushNotificationsRecord._();
  factory PushNotificationsRecord(
          [void Function(PushNotificationsRecordBuilder) updates]) =
      _$PushNotificationsRecord;

  static PushNotificationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPushNotificationsRecordData({
  String notificationImageUrl,
  String notificationSound,
  String notificationText,
  String notificationTitle,
  DocumentReference sender,
  DateTime timestamp,
}) =>
    serializers.toFirestore(
        PushNotificationsRecord.serializer,
        PushNotificationsRecord((p) => p
          ..notificationImageUrl = notificationImageUrl
          ..notificationSound = notificationSound
          ..notificationText = notificationText
          ..notificationTitle = notificationTitle
          ..sender = sender
          ..timestamp = timestamp
          ..userRefs = null));
