import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'updated_time')
  DateTime get updatedTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..uid = ''
    ..photoUrl = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserRecordData({
  String email,
  String displayName,
  String uid,
  String photoUrl,
  String phoneNumber,
  DateTime createdTime,
  DateTime updatedTime,
}) =>
    serializers.toFirestore(
        UserRecord.serializer,
        UserRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..uid = uid
          ..photoUrl = photoUrl
          ..phoneNumber = phoneNumber
          ..createdTime = createdTime
          ..updatedTime = updatedTime));
