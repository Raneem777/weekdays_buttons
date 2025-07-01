import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'model/complete_profile-model.dart';


class DoctorApiService {
  final String baseUrl = 'http://localhost:7002/api/doctor';

  Future<void> completeDoctorProfile({
    required DoctorProfileMetadata metadata,
    required List<File> files,
    required File image,
  }) async {
    final uri = Uri.parse('$baseUrl/completeProfile');
    var request = http.MultipartRequest('POST', uri);


    request.fields['metadata'] = jsonEncode(metadata.toJson());


    for (int i = 0; i < files.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(
        'files',
        files[i].path,

      ));
    }


    request.files.add(await http.MultipartFile.fromPath(
      'image',
      image.path,

    ));

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print('Profile completed successfully: $responseBody');
      } else {
        final errorBody = await response.stream.bytesToString();
        print('Error completing profile: ${response.statusCode} - $errorBody');
        throw Exception('Failed to complete profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
      throw Exception('Network error: $e');
    }
  }
}