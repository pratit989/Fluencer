import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'post_img_url')
  String get postImgUrl;

  @nullable
  @BuiltValueField(wireName: 'post_video_url')
  String get postVideoUrl;

  @nullable
  @BuiltValueField(wireName: 'post_type')
  String get postType;

  @nullable
  BuiltList<DocumentReference> get likes;

  @nullable
  @BuiltValueField(wireName: 'post_time')
  DateTime get postTime;

  @nullable
  BuiltList<DocumentReference> get fire;

  @nullable
  BuiltList<DocumentReference> get comments;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..postImgUrl = ''
    ..postVideoUrl = ''
    ..postType = ''
    ..likes = ListBuilder()
    ..fire = ListBuilder()
    ..comments = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('posts')
          : FirebaseFirestore.instance.collectionGroup('posts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('posts').doc();

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPostsRecordData({
  String postImgUrl,
  String postVideoUrl,
  String postType,
  DateTime postTime,
}) =>
    serializers.toFirestore(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..postImgUrl = postImgUrl
          ..postVideoUrl = postVideoUrl
          ..postType = postType
          ..likes = null
          ..postTime = postTime
          ..fire = null
          ..comments = null));
