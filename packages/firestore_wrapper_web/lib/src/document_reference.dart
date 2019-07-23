import 'package:firestore_wrapper/firestore_wrapper.dart' as fsw;
import 'package:firebase/firestore.dart' as fs;
import 'package:firestore_wrapper_web/src/collection_reference.dart';
import 'package:firestore_wrapper_web/src/document_snapshot.dart';
import 'package:firestore_wrapper_web/src/firestore.dart';

class DocumentReference extends fsw.DocumentReference{
  final fs.DocumentReference _ref;
  final Firestore _firestore;

  DocumentReference(this._firestore, this._ref);

  @override
  CollectionReference collection(String path) {
    return CollectionReference(this._firestore, _ref.collection(path));
  }

  @override
  Future<void> delete() {
    return _ref.delete();
  }

  @override
  String get documentID => _ref.id;

  @override
  Firestore get firestore => _firestore;

  @override
  Future<DocumentSnapshot> get() async{
    var docSnap = await _ref.get();
    return DocumentSnapshot(_firestore, docSnap);
  }

  @override
  CollectionReference parent() {
    return CollectionReference(_firestore, _ref.parent);
  }

  @override
  String get path => _ref.path;

  @override
  Future<void> setData(Map<String, dynamic> map, {bool merge = false}) {
    fs.SetOptions options = fs.SetOptions(merge: merge);
    return _ref.set(map, options);
  }

  @override
  Stream<DocumentSnapshot> snapshots() {
    return _ref.onSnapshot.map((snap)=>DocumentSnapshot(_firestore, snap));
  }

  @override
  Future<void> updateData(Map<String, dynamic> map) {
    return _ref.update(data: map);
  }
}