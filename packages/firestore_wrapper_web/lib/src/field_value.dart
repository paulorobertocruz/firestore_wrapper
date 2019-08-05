import 'package:firestore_wrapper/firestore_wrapper.dart' as fw;
import 'package:firebase/firestore.dart' as fs;


class FieldValue extends fw.FieldValue{

  fs.FieldValue arrayUnion(List<dynamic> elements) {
    return fs.FieldValue.arrayUnion(elements);
  }

  fs.FieldValue arrayRemove(List<dynamic> elements) { 
    return fs.FieldValue.arrayRemove(elements);
  }      
  
  fs.FieldValue delete() => fs.FieldValue.delete();
  
  fs.FieldValue serverTimestamp() => fs.FieldValue.serverTimestamp();
  
  fs.FieldValue increment(num value) => null;
}
