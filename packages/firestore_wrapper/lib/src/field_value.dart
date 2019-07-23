part of 'package:firestore_wrapper/firestore_wrapper.dart';

enum FieldValueType {
  arrayUnion,
  arrayRemove,
  delete,
  serverTimestamp,
  incrementDouble,
  incrementInteger,
}

class FieldValue {
  FieldValue._(this.type, this.value);

  final FieldValueType type;

  final dynamic value;

  static FieldValue arrayUnion(List<dynamic> elements) =>
      FieldValue._(FieldValueType.arrayUnion, elements);

  static FieldValue arrayRemove(List<dynamic> elements) =>
      FieldValue._(FieldValueType.arrayRemove, elements);

  static FieldValue delete() => FieldValue._(FieldValueType.delete, null);

  static FieldValue serverTimestamp() =>
      FieldValue._(FieldValueType.serverTimestamp, null);

  static FieldValue increment(num value) {
    assert(value is int || value is double);
    if (value is double) {
      return FieldValue._(FieldValueType.incrementDouble, value);
    } else if (value is int) {
      return FieldValue._(FieldValueType.incrementInteger, value);
    }
    return null;
  }
}
