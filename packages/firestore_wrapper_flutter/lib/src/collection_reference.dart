import 'package:firestore_wrapper/firestore_wrapper.dart' as fw;
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firestore_wrapper_flutter/src/document_reference.dart';
import 'package:firestore_wrapper_flutter/src/query.dart';
import 'package:firestore_wrapper_flutter/src/query_snapshot.dart';

class CollectionReference extends fw.CollectionReference {
  final fw.Firestore _firestore;
  final fs.CollectionReference _ref;

  CollectionReference(this._firestore, this._ref);

  @override
  Future<fw.DocumentReference> add(Map<String, dynamic> map) async {
    return DocumentReference(_firestore, await _ref.add(map));
  }

  @override
  fw.DocumentReference document([String path]) {
    return DocumentReference(_firestore, _ref.document(path));
  }

  @override
  fw.Firestore get firestore => _firestore;

  @override
  Future<fw.QuerySnapshot> getDocuments() async {
    return QuerySnapshot(_firestore, await _ref.getDocuments());
  }

  @override
  String get id => _ref.id;

  @override
  fw.Query limit(num length) {
    return Query(_firestore, _ref.limit(length));
  }

  @override
  fw.Query orderBy(String field, {bool descending = false}) {
    return Query(_firestore, _ref.orderBy(field, descending: descending));
  }

  @override
  fw.DocumentReference parent() {
    return DocumentReference(_firestore, _ref.parent());
  }

  @override
  String get path => _ref.path;

  @override
  fw.CollectionReference reference() {
    return CollectionReference(_firestore, _ref.reference());
  }

  @override
  Stream<fw.QuerySnapshot> snapshots() {
    return _ref
        .snapshots()
        .map((querySnap) => QuerySnapshot(_firestore, querySnap));
  }

  @override
  fw.Query where(String field,
      {isEqualTo,
      isLessThan,
      isLessThanOrEqualTo,
      isGreaterThan,
      isGreaterThanOrEqualTo,
      arrayContains,
      List<dynamic> arrayContainsAny,
      List<dynamic> whereIn,
      bool isNull}) {
    return Query(
        _firestore,
        _ref.where(
          field,
          isEqualTo: isEqualTo,
          isLessThan: isLessThan,
          isGreaterThan: isGreaterThan,
          isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
          isLessThanOrEqualTo: isLessThanOrEqualTo,
          arrayContains: arrayContains,
          arrayContainsAny: arrayContainsAny,
          whereIn: whereIn,
          isNull: isNull,
          isNull: isNull,
        ));
  }
}
