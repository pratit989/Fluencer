// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsRecord> _$commentsRecordSerializer =
    new _$CommentsRecordSerializer();

class _$CommentsRecordSerializer
    implements StructuredSerializer<CommentsRecord> {
  @override
  final Iterable<Type> types = const [CommentsRecord, _$CommentsRecord];
  @override
  final String wireName = 'CommentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commentTime;
    if (value != null) {
      result
        ..add('comment_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.postRef;
    if (value != null) {
      result
        ..add('post_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  CommentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comment_time':
          result.commentTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'post_ref':
          result.postRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
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

class _$CommentsRecord extends CommentsRecord {
  @override
  final String text;
  @override
  final DateTime commentTime;
  @override
  final DocumentReference<Object> userRef;
  @override
  final DocumentReference<Object> postRef;
  @override
  final BuiltList<DocumentReference<Object>> likes;
  @override
  final DocumentReference<Object> reference;

  factory _$CommentsRecord([void Function(CommentsRecordBuilder) updates]) =>
      (new CommentsRecordBuilder()..update(updates)).build();

  _$CommentsRecord._(
      {this.text,
      this.commentTime,
      this.userRef,
      this.postRef,
      this.likes,
      this.reference})
      : super._();

  @override
  CommentsRecord rebuild(void Function(CommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsRecordBuilder toBuilder() =>
      new CommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsRecord &&
        text == other.text &&
        commentTime == other.commentTime &&
        userRef == other.userRef &&
        postRef == other.postRef &&
        likes == other.likes &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, text.hashCode), commentTime.hashCode),
                    userRef.hashCode),
                postRef.hashCode),
            likes.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommentsRecord')
          ..add('text', text)
          ..add('commentTime', commentTime)
          ..add('userRef', userRef)
          ..add('postRef', postRef)
          ..add('likes', likes)
          ..add('reference', reference))
        .toString();
  }
}

class CommentsRecordBuilder
    implements Builder<CommentsRecord, CommentsRecordBuilder> {
  _$CommentsRecord _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  DateTime _commentTime;
  DateTime get commentTime => _$this._commentTime;
  set commentTime(DateTime commentTime) => _$this._commentTime = commentTime;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DocumentReference<Object> _postRef;
  DocumentReference<Object> get postRef => _$this._postRef;
  set postRef(DocumentReference<Object> postRef) => _$this._postRef = postRef;

  ListBuilder<DocumentReference<Object>> _likes;
  ListBuilder<DocumentReference<Object>> get likes =>
      _$this._likes ??= new ListBuilder<DocumentReference<Object>>();
  set likes(ListBuilder<DocumentReference<Object>> likes) =>
      _$this._likes = likes;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CommentsRecordBuilder() {
    CommentsRecord._initializeBuilder(this);
  }

  CommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _commentTime = $v.commentTime;
      _userRef = $v.userRef;
      _postRef = $v.postRef;
      _likes = $v.likes?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsRecord;
  }

  @override
  void update(void Function(CommentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommentsRecord build() {
    _$CommentsRecord _$result;
    try {
      _$result = _$v ??
          new _$CommentsRecord._(
              text: text,
              commentTime: commentTime,
              userRef: userRef,
              postRef: postRef,
              likes: _likes?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likes';
        _likes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CommentsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
