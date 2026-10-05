import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_data.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserData({
    required String name,
    required int age,
    required String favouriteHobby,
  }) async {
    // Save user-submitted data to Cloud Firestore.
    await _firestore.collection('users').add({
      'name': name,
      'age': age,
      'favouriteHobby': favouriteHobby,
    });
  }

  Stream<List<UserData>> getUserData() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((document) {
        return UserData.fromFirestore(document.id, document.data());
      }).toList();
    });
  }
}
