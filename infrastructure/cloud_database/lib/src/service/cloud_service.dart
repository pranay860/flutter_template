import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseService {
  /// To initlize the firebase service
  factory FirebaseService(FirebaseFirestore firebaseFirestore) {
    return FirebaseService(firebaseFirestore);
  }
}
