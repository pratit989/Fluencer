import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'conversation_refs_record.g.dart';

abstract class ConversationRefsRecord
    implements Built<ConversationRefsRecord, ConversationRefsRecordBuilder> {
  static Serializer<ConversationRefsRecord> get serializer =>
      _$conversationRefsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'conversation_ref')
  DocumentReference get conversationRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(ConversationRefsRecordBuilder builder) =>
      builder;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('conversation_refs')
          : FirebaseFirestore.instance.collectionGroup('conversation_refs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('conversation_refs').doc();

  static Stream<ConversationRefsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ConversationRefsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ConversationRefsRecord._();
  factory ConversationRefsRecord(
          [void Function(ConversationRefsRecordBuilder) updates]) =
      _$ConversationRefsRecord;

  static ConversationRefsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createConversationRefsRecordData({
  DocumentReference userRef,
  DocumentReference conversationRef,
}) =>
    serializers.toFirestore(
        ConversationRefsRecord.serializer,
        ConversationRefsRecord((c) => c
          ..userRef = userRef
          ..conversationRef = conversationRef));
