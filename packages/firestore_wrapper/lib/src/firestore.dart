part of 'package:firestore_wrapper/firestore_wrapper.dart';

abstract class Firestore{
  CollectionReference collection(String path);
  DocumentReference document(String path);
}
