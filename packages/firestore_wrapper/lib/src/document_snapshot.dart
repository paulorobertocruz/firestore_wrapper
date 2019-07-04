part of 'package:firestore_wrapper/firestore_wrapper.dart';

abstract class DocumentSnapshot{
  Map<String, dynamic> get data;
  String get documentID;
  bool get exists;
  DocumentReference get reference;
  dynamic operator [](String key) => data[key]; 
}
