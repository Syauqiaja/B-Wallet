import 'package:b_wallet/core/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage{
  final FlutterSecureStorage storage  = const FlutterSecureStorage();

  Future<void> storeUser(
    String name,
    String birthDate,
    String email,
    String phoneNumber,    
  ) async {
    await storage.write(key: "name", value: name);
    await storage.write(key: "birth_date", value: birthDate);
    await storage.write(key: "email", value: email);
    await storage.write(key: "phone_number", value: phoneNumber);
  }

  Future<UserModel> getCurrentUser() async {
    String? name = await storage.read(key: "name");
    String? birthDate = await storage.read(key: "birth_date");
    String? email = await storage.read(key: "email");
    String? phoneNumber = await storage.read(key: "phone_number");

    return UserModel(name: name!, birthDate: birthDate!, email: email!, phoneNumber: phoneNumber!);
  }

  Future<void> disposeUser() async {
    await storage.deleteAll();
  }
}