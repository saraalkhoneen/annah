import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_num" field.
  String? _phoneNum;
  String get phoneNum => _phoneNum ?? '';
  bool hasPhoneNum() => _phoneNum != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "user_ID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _phoneNum = snapshotData['phone_num'] as String?;
    _username = snapshotData['username'] as String?;
    _password = snapshotData['password'] as String?;
    _userID = snapshotData['user_ID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? phoneNum,
  String? username,
  String? password,
  String? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'phone_num': phoneNum,
      'username': username,
      'password': password,
      'user_ID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.phoneNum == e2?.phoneNum &&
        e1?.username == e2?.username &&
        e1?.password == e2?.password &&
        e1?.userID == e2?.userID;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality()
      .hash([e?.email, e?.phoneNum, e?.username, e?.password, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
