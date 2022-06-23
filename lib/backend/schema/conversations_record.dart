import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'conversations_record.g.dart';

abstract class ConversationsRecord
    implements Built<ConversationsRecord, ConversationsRecordBuilder> {
  static Serializer<ConversationsRecord> get serializer =>
      _$conversationsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_1')
  DocumentReference get user1;

  @nullable
  @BuiltValueField(wireName: 'user_2')
  DocumentReference get user2;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ConversationsRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conversations');

  static Stream<ConversationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ConversationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ConversationsRecord._();
  factory ConversationsRecord(
          [void Function(ConversationsRecordBuilder) updates]) =
      _$ConversationsRecord;

  static ConversationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createConversationsRecordData({
  DocumentReference user1,
  DocumentReference user2,
}) =>
    serializers.toFirestore(
        ConversationsRecord.serializer,
        ConversationsRecord((c) => c
          ..user1 = user1
          ..user2 = user2));
