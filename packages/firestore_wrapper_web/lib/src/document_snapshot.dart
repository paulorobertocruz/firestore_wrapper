import 'package:firestore_wrapper/firestore_wrapper.dart' as fsw;
import 'package:firebase/firestore.dart' as fs;
import 'package:firestore_wrapper_web/src/firestore.dart';
import 'package:firestore_wrapper_web/src/document_reference.dart';


class DocumentSnapshot extends fsw.DocumentSnapshot{
  final fs.DocumentSnapshot _ref;
  final Firestore _firestore;
  
  DocumentSnapshot(this._firestore, this._ref);

  @override
  Map<String, dynamic> get data => _ref.data();

  @override
  String get documentID => _ref.id;

  @override
  bool get exists => _ref.exists;

  @override
  DocumentReference get reference => DocumentReference(_firestore, _ref.ref);
  
  @override
  String toString() => data.toString();
}
