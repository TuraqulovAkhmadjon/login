import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/features/auth/data/repositories/auth_repository.dart';

class CompleteProfileViewModel extends ChangeNotifier{
  CompleteProfileViewModel({required AuthRepository repo}) : _authRepository = repo;

  final AuthRepository _authRepository;
  final bioController = TextEditingController();
  String? _gender;
  String? get gender => _gender;

  set gender(String? value){
    _gender = value;
    notifyListeners();
  }
  File? file;

  Future<void> pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    var image = await imagePicker.pickImage(source: source);
    if (image != null) {
        file = File(image.path);
    }
    notifyListeners();
  }

  Future<bool> completeProfile()async{
    if (file != null) {
      final result = await _authRepository.uploadProfilePhoto(file!);
      return result;
    }
    return true;
  }
}