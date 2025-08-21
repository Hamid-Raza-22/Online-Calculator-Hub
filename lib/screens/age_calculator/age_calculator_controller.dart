import 'package:get/get.dart';

class AgeController extends GetxController {
  var dob = Rxn<DateTime>();
  var calculateOn = Rxn<DateTime>();

  var years = 0.obs;
  var months = 0.obs;
  var days = 0.obs;

  void setDob(DateTime date) {
    dob.value = date;
    if (calculateOn.value != null) {
      calculateAge();
    }
  }

  void setCalculateOn(DateTime date) {
    calculateOn.value = date;
    if (dob.value != null) {
      calculateAge();
    }
  }

  void calculateAge() {
    DateTime start = dob.value!;
    DateTime end = calculateOn.value ?? DateTime.now();

    int yearsDiff = end.year - start.year;
    int monthsDiff = end.month - start.month;
    int daysDiff = end.day - start.day;

    if (daysDiff < 0) {
      monthsDiff--;
      daysDiff += DateTime(end.year, end.month, 0).day;
    }

    if (monthsDiff < 0) {
      yearsDiff--;
      monthsDiff += 12;
    }

    years.value = yearsDiff;
    months.value = monthsDiff;
    days.value = daysDiff;
  }


  void reset(){
    years.value=0;
    months.value=0;
    days.value=0;
    dob.value = null;
    calculateOn.value =null;
  }
}
