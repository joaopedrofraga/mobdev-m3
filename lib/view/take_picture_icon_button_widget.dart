import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePictureIconButtonWidget extends StatefulWidget {
  final Function(XFile) onPictureTaken;

  const TakePictureIconButtonWidget({super.key, required this.onPictureTaken});

  @override
  State<TakePictureIconButtonWidget> createState() =>
      _TakePictureIconButtonWidgetState();
}

class _TakePictureIconButtonWidgetState
    extends State<TakePictureIconButtonWidget> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );

      if (pickedFile != null) {
        widget.onPictureTaken(pickedFile);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erro ao tirar foto: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera_alt, color: Colors.pinkAccent),
      tooltip: 'Tirar Foto',
    );
  }
}
