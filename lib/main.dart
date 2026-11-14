import 'package:flutter/material.dart';

import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const RajangRiverCruiseApp());
}

/// Owns the view model and applies light or dark [ThemeData] from it.
class RajangRiverCruiseApp extends StatefulWidget {
  const RajangRiverCruiseApp({super.key});

  @override
  State<RajangRiverCruiseApp> createState() => _RajangRiverCruiseAppState();
}

class _RajangRiverCruiseAppState extends State<RajangRiverCruiseApp> {
  late final CruiseBookingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CruiseBookingViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sibu River Cruise & Heritage',
          theme: _lightTheme(),
          darkTheme: _darkTheme(),
          themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: CruiseBookingScreen(viewModel: _viewModel),
        );
      },
    );
  }
}

ThemeData _lightTheme() {
  const primary = Color(0xFF3E4FE0);
  return ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
      primary: primary,
    ),
    scaffoldBackgroundColor: const Color(0xFFF4F6FB),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: const CardThemeData(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
  );
}

ThemeData _darkTheme() {
  const primary = Color(0xFF9AA6FF);
  return ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF12141C),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1B1E2A),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF1E2230),
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
  );
}
