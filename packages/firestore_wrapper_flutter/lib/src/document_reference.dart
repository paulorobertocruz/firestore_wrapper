import 'package:firestore_wrapper/firestore_wrapper.dart' as fw;
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firestore_wrapper_flutter/src/collection_reference.dart';
import 'package:firestore_wrapper_flutter/src/document_snapshot.dart';

class DocumentReference extends fw.DocumentReference {
  final fw.Firestore _firestore;
  final fs.DocumentReference _ref;

  DocumentReference(this._firestore, this._ref);

  @override
  fw.CollectionReference collection(String path) {
    return CollectionReference(_firestore, _ref.collection(path));
  }

  @override
  Future<void> delete() {
    return _ref.delete();
  }

  @override
  String get documentID => _ref.documentID;

  @override
  fw.Firestore get firestore => _firestore;

  @override
  Future<fw.DocumentSnapshot> get() async {
    return DocumentSnapshot(_firestore, await _ref.get());
  }

  @override
  fw.CollectionReference parent() {
    return CollectionReference(_firestore, _ref.parent());
  }

  @override
  String get path => _ref.path;

  @override
  Future<void> setData(Map<String, dynamic> map, {bool merge = false}) {
    return _ref.setData(map, merge: merge);
  }

  @override
  Stream<fw.DocumentSnapshot> snapshots() {
    return _ref.snapshots().map((docSnap) => DocumentSnapshot(_firestore, docSnap));
  }

  @override
  Future<void> updateData(Map<String, dynamic> map) {
    return _ref.updateData(map);
  }
}
