import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobdev_m3/controller/app_colors.dart';
import 'package:mobdev_m3/view/select_date_time_icon_button_widget.dart';
import 'package:mobdev_m3/view/text_form_field_widget.dart';
import 'package:mobdev_m3/view/take_picture_icon_button_widget.dart';
import 'package:mobdev_m3/view/text_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final avistamentoController = TextEditingController();
  final detalhesAvistamentoController = TextEditingController();
  final dataHoraController = TextEditingController();
  final localizacaoController = TextEditingController();
  final enderecoController = TextEditingController();
  final observacoesController = TextEditingController();
  final _imageController = TextEditingController();

  DateTime? selectedDateTime;
  XFile? _imageFile;

  void updateDateTime(DateTime newDateTime) {
    setState(() {
      selectedDateTime = newDateTime;
      dataHoraController.text = DateFormat(
        'dd/MM/yyyy HH:mm',
      ).format(newDateTime);
    });
  }

  void _updateImage(XFile newImage) {
    setState(() {
      _imageFile = newImage;
      _imageController.text = newImage.name;
    });
  }

  void _getJson() {
    Map<String, dynamic> jsonData = {
      'tipo_avistamento': avistamentoController.text,
      'detalhes_avistamento': detalhesAvistamentoController.text,
      'data_hora': selectedDateTime?.toIso8601String(),
      'localizacao': localizacaoController.text,
      'endereco': enderecoController.text,
      'imagem_path': _imageFile?.path,
      'observacoes': observacoesController.text,
    };

    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyJson = encoder.convert(jsonData);

    print("--- DADOS DO AVISTAMENTO ---");
    print(prettyJson);
  }

  @override
  void dispose() {
    avistamentoController.dispose();
    detalhesAvistamentoController.dispose();
    dataHoraController.dispose();
    localizacaoController.dispose();
    enderecoController.dispose();
    observacoesController.dispose();
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
                  TextWidget.small('UNIVALI - 07/07/2025'),
                  TextWidget.small('Programação para Dispositivos Móveis'),
                  TextWidget.normal('Professor Fernando Concatto'),
                  const Divider(),
                  const SizedBox(height: 20),
                  TextFormFieldWidget(
                    controller: avistamentoController,
                    label: 'Tipo de Avistamento',
                    hintText: 'Ex: Animal, Plástico, etc.',
                    preffixIcon: Icon(Icons.pentagon, color: Colors.blue),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: detalhesAvistamentoController,
                    label: 'Detalhes do Avistamento',
                    hintText: 'Ex: Peixe Tilápia, Garrafa de Plástico, etc.',
                    preffixIcon: Icon(
                      Icons.add_photo_alternate_rounded,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: dataHoraController,
                    label: 'Data/Hora',
                    readOnly: true,
                    hintText: 'Selecione a data e o horário.',
                    preffixIcon: SelectDateTimeIconButtonWidget(
                      updateDateTime: updateDateTime,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: localizacaoController,
                    label: 'Localização',
                    hintText: 'Formato: Estado/Cidade/Bairro',
                    preffixIcon: Icon(
                      Icons.location_on_sharp,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    controller: enderecoController,
                    label: 'Endereço',
                    hintText: 'Ex: Rua 100, n 10, casa.',
                    preffixIcon: Icon(Icons.add_location, color: Colors.green),
                  ),
                  const SizedBox(height: 15),
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
                    controller: observacoesController,
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
                      onPressed: _getJson,
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
