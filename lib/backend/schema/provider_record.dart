import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ProviderRecord extends FirestoreRecord {
  ProviderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "provider_ID" field.
  String? _providerID;
  String get providerID => _providerID ?? '';
  bool hasProviderID() => _providerID != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "provider_loc" field.
  LatLng? _providerLoc;
  LatLng? get providerLoc => _providerLoc;
  bool hasProviderLoc() => _providerLoc != null;

  void _initializeFields() {
    _providerID = snapshotData['provider_ID'] as String?;
    _name = snapshotData['name'] as String?;
    _providerLoc = snapshotData['provider_loc'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('provider');

  static Stream<ProviderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProviderRecord.fromSnapshot(s));

  static Future<ProviderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProviderRecord.fromSnapshot(s));

  static ProviderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProviderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProviderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProviderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProviderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProviderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProviderRecordData({
  String? providerID,
  String? name,
  LatLng? providerLoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'provider_ID': providerID,
      'name': name,
      'provider_loc': providerLoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProviderRecordDocumentEquality implements Equality<ProviderRecord> {
  const ProviderRecordDocumentEquality();

  @override
  bool equals(ProviderRecord? e1, ProviderRecord? e2) {
    return e1?.providerID == e2?.providerID &&
        e1?.name == e2?.name &&
        e1?.providerLoc == e2?.providerLoc;
  }

  @override
  int hash(ProviderRecord? e) =>
      const ListEquality().hash([e?.providerID, e?.name, e?.providerLoc]);

  @override
  bool isValidKey(Object? o) => o is ProviderRecord;
}
