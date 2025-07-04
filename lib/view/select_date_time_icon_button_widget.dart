import 'package:flutter/material.dart';

class SelectDateTimeIconButtonWidget extends StatefulWidget {
  final Function(DateTime) updateDateTime;
  const SelectDateTimeIconButtonWidget({
    super.key,
    required this.updateDateTime,
  });

  @override
  State<SelectDateTimeIconButtonWidget> createState() =>
      _SelectDateTimeIconButtonWidgetState();
}

class _SelectDateTimeIconButtonWidgetState
    extends State<SelectDateTimeIconButtonWidget> {
  DateTime? selectedDateTime;

  Future<void> selectDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      // ignore: use_build_context_synchronously
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime ?? DateTime.now()),
    );

    if (pickedTime == null) return;

    final DateTime combined = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      selectedDateTime = combined;
      widget.updateDateTime(selectedDateTime!);
    });

    debugPrint("Data e hora selecionadas: $selectedDateTime");
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: selectDateTime,
      icon: Icon(Icons.calendar_month, color: Colors.orange),
    );
  }
}
