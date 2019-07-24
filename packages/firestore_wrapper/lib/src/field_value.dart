part of 'package:firestore_wrapper/firestore_wrapper.dart';


abstract class FieldValue {

  dynamic arrayUnion(List<dynamic> elements);

  dynamic arrayRemove(List<dynamic> elements);

  dynamic delete();

  dynamic serverTimestamp();

  dynamic increment(num value);
}
