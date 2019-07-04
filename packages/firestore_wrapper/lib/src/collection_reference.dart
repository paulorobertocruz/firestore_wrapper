part of 'package:firestore_wrapper/firestore_wrapper.dart';

abstract class CollectionReference extends Query{
  String get id;
  String get path;
  Future<DocumentReference> add(Map<String, dynamic> map);
  DocumentReference document([String path]);
  DocumentReference parent();
  CollectionReference reference();
}
