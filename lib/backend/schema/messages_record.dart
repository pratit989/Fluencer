import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'messages_record.g.dart';

abstract class MessagesRecord
    implements Built<MessagesRecord, MessagesRecordBuilder> {
  static Serializer<MessagesRecord> get serializer =>
      _$messagesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'message_time')
  DateTime get messageTime;

  @nullable
  @BuiltValueField(wireName: 'message_text')
  String get messageText;

  @nullable
  @BuiltValueField(wireName: 'message_type')
  String get messageType;

  @nullable
  @BuiltValueField(wireName: 'post_ref')
  DocumentReference get postRef;

  @nullable
  @BuiltValueField(wireName: 'from_user_ref')
  DocumentReference get fromUserRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(MessagesRecordBuilder builder) => builder
    ..messageText = ''
    ..messageType = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('messages').doc();

  static Stream<MessagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MessagesRecord._();
  factory MessagesRecord([void Function(MessagesRecordBuilder) updates]) =
      _$MessagesRecord;

  static MessagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMessagesRecordData({
  DateTime messageTime,
  String messageText,
  String messageType,
  DocumentReference postRef,
  DocumentReference fromUserRef,
}) =>
    serializers.toFirestore(
        MessagesRecord.serializer,
        MessagesRecord((m) => m
          ..messageTime = messageTime
          ..messageText = messageText
          ..messageType = messageType
          ..postRef = postRef
          ..fromUserRef = fromUserRef));
