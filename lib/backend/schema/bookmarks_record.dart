import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BookmarksRecord extends FirestoreRecord {
  BookmarksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bm_activities" field.
  List<DocumentReference>? _bmActivities;
  List<DocumentReference> get bmActivities => _bmActivities ?? const [];
  bool hasBmActivities() => _bmActivities != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bmActivities = getDataList(snapshotData['bm_activities']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookmarks')
          : FirebaseFirestore.instance.collectionGroup('bookmarks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bookmarks').doc(id);

  static Stream<BookmarksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarksRecord.fromSnapshot(s));

  static Future<BookmarksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookmarksRecord.fromSnapshot(s));

  static BookmarksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarksRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class BookmarksRecordDocumentEquality implements Equality<BookmarksRecord> {
  const BookmarksRecordDocumentEquality();

  @override
  bool equals(BookmarksRecord? e1, BookmarksRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.bmActivities, e2?.bmActivities);
  }

  @override
  int hash(BookmarksRecord? e) => const ListEquality().hash([e?.bmActivities]);

  @override
  bool isValidKey(Object? o) => o is BookmarksRecord;
}
