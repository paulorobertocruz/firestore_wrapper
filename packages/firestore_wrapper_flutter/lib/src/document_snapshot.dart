import 'package:firestore_wrapper/firestore_wrapper.dart' as fw;
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firestore_wrapper_flutter/src/document_reference.dart';

class DocumentSnapshot extends fw.DocumentSnapshot{
  final fw.Firestore _firestore;
  final fs.DocumentSnapshot _ref;

  DocumentSnapshot(this._firestore, this._ref);

  @override
  Map<String, dynamic> get data => _ref.data;

  @override
  String get documentID => _ref.documentID;

  @override
  bool get exists => _ref.exists;

  @override
  fw.DocumentReference get reference => DocumentReference(_firestore, _ref.reference);

}