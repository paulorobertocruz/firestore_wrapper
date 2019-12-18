import 'package:firestore_wrapper/firestore_wrapper.dart' as fsw;
import 'package:firebase/firestore.dart' as fs;
import 'package:firestore_wrapper_web/src/firestore.dart';
import 'package:firestore_wrapper_web/src/document_reference.dart';
import 'package:firestore_wrapper_web/src/query_snapshot.dart';
import 'package:firestore_wrapper_web/src/query.dart';

class CollectionReference extends fsw.CollectionReference {
  final fs.CollectionReference _ref;
  final Firestore _firestore;

  CollectionReference(this._firestore, this._ref);

  @override
  Future<DocumentReference> add(Map<String, dynamic> map) async {
    return DocumentReference(_firestore, await _ref.add(map));
  }

  @override
  DocumentReference document([String path]) {
    return DocumentReference(_firestore, _ref.doc(path));
  }

  @override
  Firestore get firestore => _firestore;

  @override
  Future<QuerySnapshot> getDocuments() async {
    return QuerySnapshot(_firestore, await _ref.get());
  }

  @override
  String get id => _ref.id;

  @override
  Query limit(num length) {
    return Query(_firestore, _ref.limit(length));
  }

  @override
  Query orderBy(String field, {bool descending = false}) {
    return Query(_firestore, _ref.orderBy(field, descending ? "desc" : "asc"));
  }

  @override
  DocumentReference parent() {
    return DocumentReference(_firestore, _ref.parent);
  }

  @override
  String get path => _ref.path;

  @override
  CollectionReference reference() {
    return CollectionReference(_firestore, _ref);
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
    String opStr;
    dynamic value;
    if (isEqualTo != null) {
      opStr = "==";
      value = isEqualTo;
    } else if (isLessThan != null) {
      opStr = "<";
      value = isLessThan;
    } else if (isLessThanOrEqualTo != null) {
      opStr = "<=";
      value = isLessThanOrEqualTo;
    } else if (isGreaterThan != null) {
      opStr = ">";
      value = isGreaterThan;
    } else if (isGreaterThanOrEqualTo != null) {
      opStr = ">=";
      value = isGreaterThanOrEqualTo;
    } else if (arrayContains != null) {
      opStr = "array-contains";
      value = arrayContains;
      // query = query.where(field, "array-contains", arrayContains);
    } else if (arrayContainsAny != null) {
      opStr = "array-contains-any";
      value = arrayContainsAny;
      // query = query.where(field, "array-contains-any", arrayContainsAny);
    } else if (whereIn != null) {
      opStr = "in";
      value = whereIn;
      // query = query.where(field, "in", whereIn);
    } else if (isNull != null) {
      //TODO: não sei o que fazer aqui, referenciar firebase web
    }
    return Query(_firestore, _ref.where(field, opStr, value));
  }
}
