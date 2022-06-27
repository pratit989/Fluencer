// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserRecord> _$userRecordSerializer = new _$UserRecordSerializer();

class _$UserRecordSerializer implements StructuredSerializer<UserRecord> {
  @override
  final Iterable<Type> types = const [UserRecord, _$UserRecord];
  @override
  final String wireName = 'UserRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UserRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wallpaperUrl;
    if (value != null) {
      result
        ..add('wallpaper_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateOfBirth;
    if (value != null) {
      result
        ..add('date_of_birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.totalFire;
    if (value != null) {
      result
        ..add('total_fire')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.followers;
    if (value != null) {
      result
        ..add('followers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.following;
    if (value != null) {
      result
        ..add('following')
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
  UserRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallpaper_url':
          result.wallpaperUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_of_birth':
          result.dateOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'total_fire':
          result.totalFire = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
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

class _$UserRecord extends UserRecord {
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final DateTime createdTime;
  @override
  final String phoneNumber;
  @override
  final String wallpaperUrl;
  @override
  final String gender;
  @override
  final DateTime dateOfBirth;
  @override
  final int totalFire;
  @override
  final BuiltList<DocumentReference<Object>> followers;
  @override
  final BuiltList<DocumentReference<Object>> following;
  @override
  final DocumentReference<Object> reference;

  factory _$UserRecord([void Function(UserRecordBuilder) updates]) =>
      (new UserRecordBuilder()..update(updates)).build();

  _$UserRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.wallpaperUrl,
      this.gender,
      this.dateOfBirth,
      this.totalFire,
      this.followers,
      this.following,
      this.reference})
      : super._();

  @override
  UserRecord rebuild(void Function(UserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserRecordBuilder toBuilder() => new UserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        wallpaperUrl == other.wallpaperUrl &&
        gender == other.gender &&
        dateOfBirth == other.dateOfBirth &&
        totalFire == other.totalFire &&
        followers == other.followers &&
        following == other.following &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, email.hashCode),
                                                    displayName.hashCode),
                                                photoUrl.hashCode),
                                            uid.hashCode),
                                        createdTime.hashCode),
                                    phoneNumber.hashCode),
                                wallpaperUrl.hashCode),
                            gender.hashCode),
                        dateOfBirth.hashCode),
                    totalFire.hashCode),
                followers.hashCode),
            following.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('wallpaperUrl', wallpaperUrl)
          ..add('gender', gender)
          ..add('dateOfBirth', dateOfBirth)
          ..add('totalFire', totalFire)
          ..add('followers', followers)
          ..add('following', following)
          ..add('reference', reference))
        .toString();
  }
}

class UserRecordBuilder implements Builder<UserRecord, UserRecordBuilder> {
  _$UserRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _wallpaperUrl;
  String get wallpaperUrl => _$this._wallpaperUrl;
  set wallpaperUrl(String wallpaperUrl) => _$this._wallpaperUrl = wallpaperUrl;

  String _gender;
  String get gender => _$this._gender;
  set gender(String gender) => _$this._gender = gender;

  DateTime _dateOfBirth;
  DateTime get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(DateTime dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  int _totalFire;
  int get totalFire => _$this._totalFire;
  set totalFire(int totalFire) => _$this._totalFire = totalFire;

  ListBuilder<DocumentReference<Object>> _followers;
  ListBuilder<DocumentReference<Object>> get followers =>
      _$this._followers ??= new ListBuilder<DocumentReference<Object>>();
  set followers(ListBuilder<DocumentReference<Object>> followers) =>
      _$this._followers = followers;

  ListBuilder<DocumentReference<Object>> _following;
  ListBuilder<DocumentReference<Object>> get following =>
      _$this._following ??= new ListBuilder<DocumentReference<Object>>();
  set following(ListBuilder<DocumentReference<Object>> following) =>
      _$this._following = following;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UserRecordBuilder() {
    UserRecord._initializeBuilder(this);
  }

  UserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _wallpaperUrl = $v.wallpaperUrl;
      _gender = $v.gender;
      _dateOfBirth = $v.dateOfBirth;
      _totalFire = $v.totalFire;
      _followers = $v.followers?.toBuilder();
      _following = $v.following?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserRecord;
  }

  @override
  void update(void Function(UserRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserRecord build() {
    _$UserRecord _$result;
    try {
      _$result = _$v ??
          new _$UserRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              wallpaperUrl: wallpaperUrl,
              gender: gender,
              dateOfBirth: dateOfBirth,
              totalFire: totalFire,
              followers: _followers?.build(),
              following: _following?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'followers';
        _followers?.build();
        _$failedField = 'following';
        _following?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
