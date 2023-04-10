import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdapter extends FirebasePort {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<Either<NetworkError, UserDetailsModel>> getUserData(
      String userId) async {
    try {
      final result =
          await _firebaseFirestore.collection("users").doc(userId).get();
      if (result.exists) {
        final userData = result.data();
        return Right(UserDetailsModel(
            firstName: userData?["first_name"],
            lastName: userData?["last_name"],
            email: userData?["email"],
            phoneNumber: userData?["phone_number"],
            password: userData?["password"],
            gender: userData?["gender"]));
      }
      return Left(
          NetworkError(httpError: 0, cause: Exception("User not found!")));
    } catch (e) {
      return Left(NetworkError(httpError: 0, cause: Exception(e.toString())));
    }
  }

  @override
  Future<Either<NetworkError, bool>> storeUserData(
      String userId, UserDetailsModel userDetailsModel) async {
    try {
      await _firebaseFirestore.collection("users").doc(userId).set({
        "first_name": userDetailsModel.firstName,
        "email": userDetailsModel.email,
        "last_name": userDetailsModel.lastName,
        "phone_number": userDetailsModel.phoneNumber,
        "password": userDetailsModel.password,
        "gender": userDetailsModel.gender
      });
      return const Right(true);
    } catch (e) {
      return Left(NetworkError(httpError: 0, cause: Exception(e.toString())));
    }
  }
}
