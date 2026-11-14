import 'package:flutter/material.dart';

/// ImageSection: hero banner for the cruise landmark.
class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.imageAsset,
    required this.landmark,
    this.height,
  });

  final String imageAsset;
  final String landmark;

  /// Fixed height for the portrait list. Leave null to fill the landscape pane.
  final double? height;

  @override
  Widget build(BuildContext context) {
    final banner = Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imageAsset,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const ColoredBox(
              color: Color(0xFF3E4FE0),
              child: Center(
                child: Icon(
                  Icons.directions_boat_filled,
                  color: Colors.white,
                  size: 64,
                ),
              ),
            );
          },
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x14000000), Color(0x00000000), Color(0xCC000000)],
              stops: [0, 0.45, 1],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 14,
          child: Text(
            landmark,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              shadows: [Shadow(color: Colors.black54, blurRadius: 8)],
            ),
          ),
        ),
      ],
    );

    if (height == null) {
      return banner;
    }

    return SizedBox(height: height, width: double.infinity, child: banner);
  }
}
