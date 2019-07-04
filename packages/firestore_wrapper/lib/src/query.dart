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
      bool isNull,
    });
  
  Future<QuerySnapshot> getDocuments();
  Stream<QuerySnapshot> snapshots();
}

