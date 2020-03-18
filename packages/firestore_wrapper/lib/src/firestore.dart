part of 'package:firestore_wrapper/firestore_wrapper.dart';

abstract class Firestore{
  CollectionReference collection(String path);
  Query collectionGroup(String path);
  DocumentReference document(String path);
}
