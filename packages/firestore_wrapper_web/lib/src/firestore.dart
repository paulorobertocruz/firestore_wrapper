import 'package:firestore_wrapper/firestore_wrapper.dart' as fsw;
import 'package:firebase/firebase.dart' as fb;

import 'package:firestore_wrapper_web/src/collection_reference.dart';
import 'package:firestore_wrapper_web/src/document_reference.dart';

class Firestore extends fsw.Firestore{
  static final _firestore = fb.firestore();
  static final Firestore instance = Firestore();

  @override
  CollectionReference collection(String path) {
    return CollectionReference(this, _firestore.collection(path));
  }

  @override
  DocumentReference document(String path) {
    return DocumentReference(this, _firestore.doc(path));
  }

}