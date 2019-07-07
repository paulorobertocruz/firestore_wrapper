import 'package:firestore_wrapper/firestore_wrapper.dart' as fw;
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firestore_wrapper_flutter/src/document_snapshot.dart';

class QuerySnapshot extends fw.QuerySnapshot{
  final fw.Firestore _firestore;
  final fs.QuerySnapshot _ref;

  QuerySnapshot(this._firestore, this._ref);

  @override
  //TODO: resolver DocumentChange class
  List<fw.DocumentSnapshot> get documentChanges => null;

  @override
  List<fw.DocumentSnapshot> get documents => _ref.documents.map((docSnap)=>DocumentSnapshot(_firestore, docSnap)).toList();
}