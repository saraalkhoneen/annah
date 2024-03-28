import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ReservationRecord extends FirestoreRecord {
  ReservationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reservation_ID" field.
  String? _reservationID;
  String get reservationID => _reservationID ?? '';
  bool hasReservationID() => _reservationID != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "activity_ID" field.
  DocumentReference? _activityID;
  DocumentReference? get activityID => _activityID;
  bool hasActivityID() => _activityID != null;

  // "user_ID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _reservationID = snapshotData['reservation_ID'] as String?;
    _dateTime = snapshotData['date_time'] as DateTime?;
    _activityID = snapshotData['activity_ID'] as DocumentReference?;
    _userID = snapshotData['user_ID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservation');

  static Stream<ReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationRecord.fromSnapshot(s));

  static Future<ReservationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationRecord.fromSnapshot(s));

  static ReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationRecordData({
  String? reservationID,
  DateTime? dateTime,
  DocumentReference? activityID,
  DocumentReference? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reservation_ID': reservationID,
      'date_time': dateTime,
      'activity_ID': activityID,
      'user_ID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationRecordDocumentEquality implements Equality<ReservationRecord> {
  const ReservationRecordDocumentEquality();

  @override
  bool equals(ReservationRecord? e1, ReservationRecord? e2) {
    return e1?.reservationID == e2?.reservationID &&
        e1?.dateTime == e2?.dateTime &&
        e1?.activityID == e2?.activityID &&
        e1?.userID == e2?.userID;
  }

  @override
  int hash(ReservationRecord? e) => const ListEquality()
      .hash([e?.reservationID, e?.dateTime, e?.activityID, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is ReservationRecord;
}
