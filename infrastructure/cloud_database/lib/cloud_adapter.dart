import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudDbAdapter extends CloudDbPort {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
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
            gender: userData?["gender"],
            userImage: userData?["user_image"]));
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
      String? taskSnapshot;
      if (userDetailsModel.userImage != null) {
        final userImage = await _firebaseStorage
            .ref("users/$userId/user_image.png")
            .putFile(userDetailsModel.userImage!);
        //
        taskSnapshot = await userImage.ref.getDownloadURL();
      }
      await _firebaseFirestore.collection("users").doc(userId).set({
        "first_name": userDetailsModel.firstName,
        "email": userDetailsModel.email,
        "last_name": userDetailsModel.lastName,
        "phone_number": userDetailsModel.phoneNumber,
        "password": userDetailsModel.password,
        "gender": userDetailsModel.gender,
        "user_image": taskSnapshot
      });
      return const Right(true);
    } catch (e) {
      return Left(NetworkError(httpError: 0, cause: Exception(e.toString())));
    }
  }
}
