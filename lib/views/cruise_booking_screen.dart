import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';
import '../widgets/action_bar_widget.dart';
import '../widgets/booking_controls_widget.dart';
import '../widgets/description_widget.dart';
import '../widgets/header_image_widget.dart';
import '../widgets/title_section_widget.dart';

/// Assembles the modular sections and switches layout with orientation.
class CruiseBookingScreen extends StatelessWidget {
  const CruiseBookingScreen({super.key, required this.viewModel});

  final CruiseBookingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sibu River Cruise & Heritage')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return OrientationBuilder(
            builder: (context, orientation) {
              final isLandscape = orientation == Orientation.landscape;
              final destination = viewModel.destination;
              final details = <Widget>[
                TitleSection(
                  name: destination.name,
                  location: destination.location,
                  starCount: viewModel.starCount,
                  onStarPressed: viewModel.incrementStarCount,
                ),
                const ButtonSection(),
                TextSection(
                  description: destination.description,
                  showHeading: isLandscape,
                ),
                PreferenceSection(viewModel: viewModel),
              ];

              final header = ImageSection(
                imageAsset: destination.imageAsset,
                landmark: destination.landmark,
                height: isLandscape ? null : 250,
              );

              if (isLandscape) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 5, child: header),
                    Expanded(
                      flex: 6,
                      child: ListView(
                        padding: const EdgeInsets.only(top: 4),
                        children: details,
                      ),
                    ),
                  ],
                );
              }

              return ListView(children: [header, ...details]);
            },
          );
        },
      ),
    );
  }
}
