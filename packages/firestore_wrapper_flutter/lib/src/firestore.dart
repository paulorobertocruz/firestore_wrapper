import 'package:firestore_wrapper/firestore_wrapper.dart' as fw;
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firestore_wrapper_flutter/src/collection_reference.dart';
import 'package:firestore_wrapper_flutter/src/document_reference.dart';
import 'package:firestore_wrapper_flutter/src/query.dart';

class Firestore extends fw.Firestore {
  final fs.Firestore _firestore = fs.Firestore.instance;

  @override
  CollectionReference collection(String path) {
    return CollectionReference(this, _firestore.collection(path));
  }

  @override
  Query collectionGroup(String path) {
    return Query(this, _firestore.collectionGroup(path));
  }

  @override
  DocumentReference document(String path) {
    return DocumentReference(this, _firestore.document(path));
  }
}
