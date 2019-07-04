abstract class DocumentReference{
  String get documentID;
  Firestore get firestore;
  String get path;
  CollectionReference collection(String path);
  Future<void> delete();
  Future<DocumentSnapshot> get();
  CollectionReference parent();
  Future<void> setData(Map<String, dynamic> map, {bool merge: false});
  Stream<DocumentSnapshot> snapshots();
  Future<void> updateData(Map<String, dynamic> map);
}
