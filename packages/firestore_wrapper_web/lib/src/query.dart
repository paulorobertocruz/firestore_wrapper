import 'package:firestore_wrapper/firestore_wrapper.dart' as fsw;
import 'package:firebase/firestore.dart' as fs;
import 'package:firestore_wrapper_web/src/query_snapshot.dart';
import 'package:firestore_wrapper_web/src/firestore.dart';

class Query extends fsw.Query {
  final Firestore _firestore;
  final fs.Query _ref;
  Query(this._firestore, this._ref);

  @override
  Firestore get firestore => _firestore;

  @override
  Future<QuerySnapshot> getDocuments() async {
    return QuerySnapshot(_firestore, await _ref.get());
  }

  @override
  Query limit(num length) {
    return Query(_firestore, _ref.limit(length));
  }

  @override
  Query orderBy(String field, {bool descending = false}) {
    return Query(_firestore, _ref.orderBy(field, descending ? "desc" : "asc"));
  }

  @override
  Stream<QuerySnapshot> snapshots() {
    return _ref.onSnapshot.map((snap) => QuerySnapshot(_firestore, snap));
  }

  @override
  Query where(
    String field, {
    isEqualTo,
    isLessThan,
    isLessThanOrEqualTo,
    isGreaterThan,
    isGreaterThanOrEqualTo,
    arrayContains,
    List<dynamic> arrayContainsAny,
    List<dynamic> whereIn,
    bool isNull,
  }) {
    var query = _ref;
    if (isEqualTo != null) query = query.where(field, "==", isEqualTo);
    if (isLessThan != null) query = query.where(field, "<", isLessThan);
    if (isLessThanOrEqualTo != null) query = query.where(field, "<=", isLessThanOrEqualTo);
    if (isGreaterThan != null) query = query.where(field, ">", isGreaterThan);
    if (isGreaterThanOrEqualTo != null) query = query.where(field, "<", isGreaterThanOrEqualTo);
    if (arrayContains != null) query = query.where(field, "array-contains", arrayContains);
    if (arrayContainsAny != null) query = query.where(field, "array-contains-any", arrayContainsAny);
    if (whereIn != null) query = query.where(field, "in", whereIn);
    return Query(_firestore, query);
  }
}
