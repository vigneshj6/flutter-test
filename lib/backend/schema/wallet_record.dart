import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'wallet_record.g.dart';

abstract class WalletRecord
    implements Built<WalletRecord, WalletRecordBuilder> {
  static Serializer<WalletRecord> get serializer => _$walletRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  double get amount;

  @nullable
  @BuiltValueField(wireName: 'updated_time')
  DateTime get updatedTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(WalletRecordBuilder builder) =>
      builder..amount = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wallet');

  static Stream<WalletRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  WalletRecord._();
  factory WalletRecord([void Function(WalletRecordBuilder) updates]) =
      _$WalletRecord;

  static WalletRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createWalletRecordData({
  DocumentReference user,
  double amount,
  DateTime updatedTime,
}) =>
    serializers.toFirestore(
        WalletRecord.serializer,
        WalletRecord((w) => w
          ..user = user
          ..amount = amount
          ..updatedTime = updatedTime));
