import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? _image;
  String? _base64Image;
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;
  double? _latitude;
  double? _longitude;
  Future<void> _pickImage(ImageSource source) async {
    final PickedFile = await _picker.pickImage(source: source);
    if (PickedFile != null) {
      setState(() {
        _image = File(PickedFile.path);
      });
      await _compressAndEncodeImage();
    }
  }

  Future<void> _compressAndEncodeImage() async {
    final compressedImage = await FlutterImageCompress.compressWithFile(
      _image!.path,
      quality: 50,
    );
    if (compressedImage == null) return;
    {
      setState(() {
        _base64Image = base64Encode(compressedImage);
      });
    }
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location Services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        throw Exception('Location Permissions are denied.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}