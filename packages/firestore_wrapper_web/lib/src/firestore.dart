import  'package:firestore_wrapper/firestore_wrapper.dart' as fw;
import 'package:firebase/firestore.dart' as fs;

class Firestore extends fw.Firestore{
  @override
  fw.CollectionReference collection(String path) {
    return null;
  }

  @override
  fw.DocumentReference document(String path) {
    // TODO: implement document
    return null;
  }

}