import 'package:firestore_wrapper/firestore_wrapper.dart' as fsw;
import 'package:firebase/firestore.dart' as fs;
import 'package:firestore_wrapper_web/src/document_snapshot.dart';
import 'package:firestore_wrapper_web/src/firestore.dart';

class QuerySnapshot extends fsw.QuerySnapshot{
  final Firestore _firestore;
  final fs.QuerySnapshot _ref;
  QuerySnapshot(this._firestore, this._ref);

  @override
  // TODO: implement documentChanges
  List<DocumentSnapshot> get documentChanges => null;

  @override
  List<DocumentSnapshot> get documents => _ref.docs.map((doc)=>DocumentSnapshot(_firestore, doc)).toList();
}