import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityRecord extends FirestoreRecord {
  ActivityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "activity_ID" field.
  String? _activityID;
  String get activityID => _activityID ?? '';
  bool hasActivityID() => _activityID != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "bm_activities" field.
  List<DocumentReference>? _bmActivities;
  List<DocumentReference> get bmActivities => _bmActivities ?? const [];
  bool hasBmActivities() => _bmActivities != null;

  // "provider_ID" field.
  DocumentReference? _providerID;
  DocumentReference? get providerID => _providerID;
  bool hasProviderID() => _providerID != null;

  void _initializeFields() {
    _activityID = snapshotData['activity_ID'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _type = snapshotData['type'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _bmActivities = getDataList(snapshotData['bm_activities']);
    _providerID = snapshotData['provider_ID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activity');

  static Stream<ActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityRecord.fromSnapshot(s));

  static Future<ActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityRecord.fromSnapshot(s));

  static ActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityRecordData({
  String? activityID,
  String? name,
  String? description,
  String? type,
  double? price,
  String? image,
  DocumentReference? providerID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activity_ID': activityID,
      'name': name,
      'description': description,
      'type': type,
      'price': price,
      'image': image,
      'provider_ID': providerID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityRecordDocumentEquality implements Equality<ActivityRecord> {
  const ActivityRecordDocumentEquality();

  @override
  bool equals(ActivityRecord? e1, ActivityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.activityID == e2?.activityID &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.type == e2?.type &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.bmActivities, e2?.bmActivities) &&
        e1?.providerID == e2?.providerID;
  }

  @override
  int hash(ActivityRecord? e) => const ListEquality().hash([
        e?.activityID,
        e?.name,
        e?.description,
        e?.type,
        e?.price,
        e?.image,
        e?.bmActivities,
        e?.providerID
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivityRecord;
}
