import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../reposatory/model/complete_profile-model.dart';
import '../viewModel/complete_profile_viewModel.dart';
class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => DoctorProfileScreenState();
}
class DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  List<File> selectedFiles = [];
  File? selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFiles() async {
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        selectedFiles = pickedFiles.map((xFile) => File(xFile.path)).toList();
      });
    }
  }

  Future<void> pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Doctor Profile'),
      ),
      body: Consumer<DoctorProfileViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: pickFiles,
                  child: Text('Select Files (${selectedFiles.length} selected)'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: pickImage,
                  child: Text(selectedImage == null ? 'Select Image' : 'Image Selected'),
                ),
                const SizedBox(height: 20),
                if (viewModel.isLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {
                      if (selectedImage == null || selectedFiles.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select at least one file and an image.')),
                        );
                        return;
                      }
                      final metadata = DoctorProfileMetadata(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                      
                      );
                      viewModel.submitDoctorProfile(
                        metadata: metadata,
                        selectedFiles: selectedFiles,
                        selectedImage: selectedImage!,
                      );
                    },
                    child: const Text('Complete Profile'),
                  ),
                if (viewModel.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Error: ${viewModel.errorMessage}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}