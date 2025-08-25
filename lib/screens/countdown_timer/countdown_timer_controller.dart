import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountdownController extends GetxController {

  final TextEditingController eventNameController = TextEditingController();
  var showResult = false.obs;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);

  Rx<Duration> remainingTime = Duration.zero.obs;
  DateTime? eventDateTime;
  RxBool isRunning = false.obs;

  void setDate(DateTime? date) {
    selectedDate.value = date;
    _updateEventDateTime();
  }

  void setTime(TimeOfDay? time) {
    selectedTime.value = time;
    _updateEventDateTime();
  }

  void _updateEventDateTime() {
    if (selectedDate.value != null && selectedTime.value != null) {
      eventDateTime = DateTime(
        selectedDate.value!.year,
        selectedDate.value!.month,
        selectedDate.value!.day,
        selectedTime.value!.hour,
        selectedTime.value!.minute,
      );
    }
  }


  void startCountdown() {
    if (eventDateTime == null) return;

    isRunning.value = true;
    _tick();
  }

  void _tick() async {
    while (isRunning.value) {
      final now = DateTime.now();
      if (eventDateTime != null && eventDateTime!.isAfter(now)) {
        remainingTime.value = eventDateTime!.difference(now);
      } else {
        remainingTime.value = Duration.zero;
        isRunning.value = false;
        break;
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }


  void reset() {
    isRunning.value = false;
    remainingTime.value = Duration.zero;
    selectedDate.value = null;
    selectedTime.value = null;
    eventNameController.clear();
    eventDateTime=null;
  }


  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void onClose() {
    eventNameController.dispose();
    super.onClose();
  }
}
