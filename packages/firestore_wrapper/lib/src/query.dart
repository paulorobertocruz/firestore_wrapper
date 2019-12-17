part of 'package:firestore_wrapper/firestore_wrapper.dart';

abstract class Query{
  Firestore get firestore;

  Query limit(num length);
  Query orderBy(String field, {bool descending: false});
  Query where( String field, {
      dynamic isEqualTo,
      dynamic isLessThan,
      dynamic isLessThanOrEqualTo,
      dynamic isGreaterThan,
      dynamic isGreaterThanOrEqualTo,
      dynamic arrayContains,
      List<dynamic> arrayContainsAny,
      List<dynamic> whereIn,
      bool isNull,
    });
  
  Future<QuerySnapshot> getDocuments();
  Stream<QuerySnapshot> snapshots();
}

