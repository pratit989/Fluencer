// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.postImgUrl;
    if (value != null) {
      result
        ..add('post_img_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postVideoUrl;
    if (value != null) {
      result
        ..add('post_video_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postType;
    if (value != null) {
      result
        ..add('post_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.postTime;
    if (value != null) {
      result
        ..add('post_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.fire;
    if (value != null) {
      result
        ..add('fire')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PostsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'post_img_url':
          result.postImgUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'post_video_url':
          result.postVideoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'post_type':
          result.postType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'post_time':
          result.postTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'fire':
          result.fire.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$PostsRecord extends PostsRecord {
  @override
  final String postImgUrl;
  @override
  final String postVideoUrl;
  @override
  final String postType;
  @override
  final BuiltList<DocumentReference<Object>> likes;
  @override
  final DateTime postTime;
  @override
  final BuiltList<DocumentReference<Object>> fire;
  @override
  final BuiltList<DocumentReference<Object>> comments;
  @override
  final String description;
  @override
  final DocumentReference<Object> reference;

  factory _$PostsRecord([void Function(PostsRecordBuilder) updates]) =>
      (new PostsRecordBuilder()..update(updates)).build();

  _$PostsRecord._(
      {this.postImgUrl,
      this.postVideoUrl,
      this.postType,
      this.likes,
      this.postTime,
      this.fire,
      this.comments,
      this.description,
      this.reference})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        postImgUrl == other.postImgUrl &&
        postVideoUrl == other.postVideoUrl &&
        postType == other.postType &&
        likes == other.likes &&
        postTime == other.postTime &&
        fire == other.fire &&
        comments == other.comments &&
        description == other.description &&
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
                            $jc(
                                $jc($jc(0, postImgUrl.hashCode),
                                    postVideoUrl.hashCode),
                                postType.hashCode),
                            likes.hashCode),
                        postTime.hashCode),
                    fire.hashCode),
                comments.hashCode),
            description.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostsRecord')
          ..add('postImgUrl', postImgUrl)
          ..add('postVideoUrl', postVideoUrl)
          ..add('postType', postType)
          ..add('likes', likes)
          ..add('postTime', postTime)
          ..add('fire', fire)
          ..add('comments', comments)
          ..add('description', description)
          ..add('reference', reference))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord _$v;

  String _postImgUrl;
  String get postImgUrl => _$this._postImgUrl;
  set postImgUrl(String postImgUrl) => _$this._postImgUrl = postImgUrl;

  String _postVideoUrl;
  String get postVideoUrl => _$this._postVideoUrl;
  set postVideoUrl(String postVideoUrl) => _$this._postVideoUrl = postVideoUrl;

  String _postType;
  String get postType => _$this._postType;
  set postType(String postType) => _$this._postType = postType;

  ListBuilder<DocumentReference<Object>> _likes;
  ListBuilder<DocumentReference<Object>> get likes =>
      _$this._likes ??= new ListBuilder<DocumentReference<Object>>();
  set likes(ListBuilder<DocumentReference<Object>> likes) =>
      _$this._likes = likes;

  DateTime _postTime;
  DateTime get postTime => _$this._postTime;
  set postTime(DateTime postTime) => _$this._postTime = postTime;

  ListBuilder<DocumentReference<Object>> _fire;
  ListBuilder<DocumentReference<Object>> get fire =>
      _$this._fire ??= new ListBuilder<DocumentReference<Object>>();
  set fire(ListBuilder<DocumentReference<Object>> fire) => _$this._fire = fire;

  ListBuilder<DocumentReference<Object>> _comments;
  ListBuilder<DocumentReference<Object>> get comments =>
      _$this._comments ??= new ListBuilder<DocumentReference<Object>>();
  set comments(ListBuilder<DocumentReference<Object>> comments) =>
      _$this._comments = comments;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postImgUrl = $v.postImgUrl;
      _postVideoUrl = $v.postVideoUrl;
      _postType = $v.postType;
      _likes = $v.likes?.toBuilder();
      _postTime = $v.postTime;
      _fire = $v.fire?.toBuilder();
      _comments = $v.comments?.toBuilder();
      _description = $v.description;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostsRecord build() {
    _$PostsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostsRecord._(
              postImgUrl: postImgUrl,
              postVideoUrl: postVideoUrl,
              postType: postType,
              likes: _likes?.build(),
              postTime: postTime,
              fire: _fire?.build(),
              comments: _comments?.build(),
              description: description,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likes';
        _likes?.build();

        _$failedField = 'fire';
        _fire?.build();
        _$failedField = 'comments';
        _comments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
