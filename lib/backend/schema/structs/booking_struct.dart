// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingStruct extends FFFirebaseStruct {
  BookingStruct({
    bool? bookmarked,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bookmarked = bookmarked,
        super(firestoreUtilData);

  // "bookmarked" field.
  bool? _bookmarked;
  bool get bookmarked => _bookmarked ?? false;
  set bookmarked(bool? val) => _bookmarked = val;
  bool hasBookmarked() => _bookmarked != null;

  static BookingStruct fromMap(Map<String, dynamic> data) => BookingStruct(
        bookmarked: data['bookmarked'] as bool?,
      );

  static BookingStruct? maybeFromMap(dynamic data) =>
      data is Map ? BookingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'bookmarked': _bookmarked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bookmarked': serializeParam(
          _bookmarked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BookingStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingStruct(
        bookmarked: deserializeParam(
          data['bookmarked'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BookingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookingStruct && bookmarked == other.bookmarked;
  }

  @override
  int get hashCode => const ListEquality().hash([bookmarked]);
}

BookingStruct createBookingStruct({
  bool? bookmarked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BookingStruct(
      bookmarked: bookmarked,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BookingStruct? updateBookingStruct(
  BookingStruct? booking, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    booking
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBookingStructData(
  Map<String, dynamic> firestoreData,
  BookingStruct? booking,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (booking == null) {
    return;
  }
  if (booking.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && booking.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bookingData = getBookingFirestoreData(booking, forFieldValue);
  final nestedData = bookingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = booking.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBookingFirestoreData(
  BookingStruct? booking, [
  bool forFieldValue = false,
]) {
  if (booking == null) {
    return {};
  }
  final firestoreData = mapToFirestore(booking.toMap());

  // Add any Firestore field values
  booking.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBookingListFirestoreData(
  List<BookingStruct>? bookings,
) =>
    bookings?.map((e) => getBookingFirestoreData(e, true)).toList() ?? [];
