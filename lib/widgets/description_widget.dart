import 'package:flutter/material.dart';

/// TextSection: padded description of the destination.
class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
    this.showHeading = false,
  });

  final String description;
  final bool showHeading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeading) ...[
            Text(
              'About the Destination',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.78),
            ),
          ),
        ],
      ),
    );
  }
}
