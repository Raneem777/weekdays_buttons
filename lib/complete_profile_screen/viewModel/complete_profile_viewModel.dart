
import 'package:flutter/material.dart';
import 'dart:io';

import '../reposatory/model/complete_profile-model.dart';
import '../reposatory/services.dart';

class DoctorProfileViewModel extends ChangeNotifier {
  final DoctorApiService _apiService = DoctorApiService();

  bool isLoading = false;
  String? errorMessage;



  Future<void> submitDoctorProfile({
    required DoctorProfileMetadata metadata,
    required List<File> selectedFiles,
    required File selectedImage,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _apiService.completeDoctorProfile(
        metadata: metadata,
        files: selectedFiles,
        image: selectedImage,
      );

      print('Submission successful!');
    } catch (e) {
      errorMessage = e.toString();
      print('Submission failed: $errorMessage');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}