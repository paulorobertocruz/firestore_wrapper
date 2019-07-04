part of 'package:firestore_wrapper/firestore_wrapper.dart';

abstract class QuerySnapshot{
   List<DocumentSnapshot> get documents;
   List<DocumentSnapshot> get documentChanges; 
}
