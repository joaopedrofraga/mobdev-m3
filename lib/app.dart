import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobdev_m3/controller/app_colors.dart';
import 'package:mobdev_m3/view/text_form_field_widget.dart';
import 'package:mobdev_m3/view/text_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormFieldWidget(
                  controller: TextEditingController(),
                  label: 'Tipo de Avistamento',
                  hintText: 'Animal ou Plástico',
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
                  label: 'Localização',
                  hintText: 'Insira a localização.',
                  preffixIcon: Icon(
                    Icons.location_on_sharp,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                  controller: TextEditingController(),
                  label: 'Data/Hora',
                  hintText: 'Insira a data e o horário do avistamento.',
                  preffixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.pinkAccent,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
