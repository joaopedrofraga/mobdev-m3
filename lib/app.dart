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
      theme: ThemeData(textTheme: GoogleFonts.bricolageGrotesqueTextTheme()),
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: TextWidget.title('Novo Avistamento'),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [TextFormFieldWidget(controller: TextEditingController())],
        ),
      ),
    );
  }
}
