import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  void getMusicList() {
    print(firebaseStorage.bucket);
  }
}
