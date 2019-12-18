import 'package:firestore_wrapper/firestore_wrapper.dart' as fw;
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firestore_wrapper_flutter/src/query_snapshot.dart';

class Query extends fw.Query {
  final fw.Firestore _firestore;
  final fs.Query _ref;

  Query(this._firestore, this._ref);

  @override
  fw.Firestore get firestore => _firestore;

  @override
  Future<fw.QuerySnapshot> getDocuments() async {
    return QuerySnapshot(_firestore, await _ref.getDocuments());
  }

  @override
  fw.Query limit(num length) {
    return Query(_firestore, _ref.limit(length));
  }

  @override
  fw.Query orderBy(String field, {bool descending = false}) {
    return Query(_firestore, _ref.orderBy(field, descending: descending));
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
        ));
  }
}
