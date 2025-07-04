import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobdev_m3/controller/app_colors.dart';
import 'package:mobdev_m3/view/select_date_time_icon_button_widget.dart';
import 'package:mobdev_m3/view/take_picture_icon_button_widget.dart';
import 'package:mobdev_m3/view/text_form_field_widget.dart';
import 'package:mobdev_m3/view/text_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  DateTime? selectedDateTime;
  final _imageController = TextEditingController();
  XFile? _imageFile;

  void updateDateTime(DateTime newDateTime) {
    setState(() {
      selectedDateTime = newDateTime;
    });
  }

  void _updateImage(XFile newImage) {
    setState(() {
      _imageFile = newImage;
      _imageController.text = newImage.name;
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.bricolageGrotesqueTextTheme(),
        colorSchemeSeed: AppColors.primaryColor,
      ),
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: TextWidget.title('Novo Avistamento'),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          leading: Tooltip(
            message:
                'Alunos\n- Ian Callegari Aragão\n- João Pedro Tonatto Fraga\n- Lucas Losekann Rosa\n- Maria Eduarda Alves Martim',
            child: Icon(Icons.info, color: AppColors.whiteColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18).copyWith(top: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.small('UNIVALI - 04/07/2025'),
                  TextWidget.small('Programação para Dispositivos Móveis'),
                  TextWidget.normal('Professor Fernando Concatto'),
                  const Divider(),
                  const SizedBox(height: 20),

                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    label: 'Tipo de Avistamento',
                    hintText: 'Ex: Animal, Plástico, etc.',
                    preffixIcon: Icon(Icons.pentagon, color: Colors.blue),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    label: 'Detalhes do Avistamento',
                    hintText: 'Ex: Peixe Tilápia, Garrafa de Plástico, etc.',
                    preffixIcon: Icon(
                      Icons.add_photo_alternate_rounded,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    label: 'Data/Hora',
                    hintText: 'Insira a data e o horário do avistamento.',
                    preffixIcon: SelectDateTimeIconButtonWidget(
                      updateDateTime: updateDateTime,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    label: 'Localização',
                    hintText: 'Formato: Estado/Cidade/Bairro',
                    preffixIcon: Icon(
                      Icons.location_on_sharp,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    label: 'Endereço',
                    hintText: 'Ex: Rua 100, n 10, casa.',
                    preffixIcon: Icon(Icons.add_location, color: Colors.green),
                  ),
                  const SizedBox(height: 15),
                  /*if (_imageFile != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(_imageFile!.path),
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),*/
                  TextFormFieldWidget(
                    controller: _imageController,
                    label: 'Imagem',
                    hintText: 'Clique na câmera para tirar uma foto.',
                    readOnly: true,
                    preffixIcon: TakePictureIconButtonWidget(
                      onPictureTaken: _updateImage,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    label: 'Observações',
                    hintText: 'Ex: Na esquina da rua tal...',
                    preffixIcon: Icon(Icons.description, color: Colors.yellow),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextWidget.normal('Salvar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
