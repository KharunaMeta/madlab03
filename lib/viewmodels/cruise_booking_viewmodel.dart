import 'package:flutter/foundation.dart';

import '../models/cruise_destination.dart';

/// Booking state and the actions the screen can perform.
///
/// Widgets read these fields and call the methods below. Each change
/// calls [notifyListeners] so listening views rebuild.
class CruiseBookingViewModel extends ChangeNotifier {
  CruiseDestination destination = CruiseDestination.rajangExpress;

  static const List<String> cruisePackages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  DateTime visitDate = DateTime(2026, 11, 18);
  String selectedPackage = cruisePackages[1];
  bool isDarkMode = false;
  int starCount = 41;

  String get formattedVisitDate {
    final day = visitDate.day.toString().padLeft(2, '0');
    final month = visitDate.month.toString().padLeft(2, '0');
    return '$day/$month/${visitDate.year}';
  }

  void setVisitDate(DateTime date) {
    visitDate = date;
    notifyListeners();
  }

  void setPackage(String package) {
    selectedPackage = package;
    notifyListeners();
  }

  void setDarkMode(bool enabled) {
    isDarkMode = enabled;
    notifyListeners();
  }

  void incrementStarCount() {
    starCount += 1;
    notifyListeners();
  }
}
