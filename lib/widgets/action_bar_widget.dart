import 'package:flutter/material.dart';

/// ButtonSection: Call, Route, and Share, spaced evenly.
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardTheme.color;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Material(
        color: cardColor,
        elevation: 1,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ActionButton(
                icon: Icons.call,
                label: 'CALL',
                color: const Color(0xFF3D7EFF),
                onPressed: () => _showMessage(
                  context,
                  'Calling the Sibu River Cruise office…',
                ),
              ),
              _ActionButton(
                icon: Icons.near_me,
                label: 'ROUTE',
                color: const Color(0xFF7C4DFF),
                onPressed: () => _showMessage(
                  context,
                  'Opening the route to Sibu Waterfront…',
                ),
              ),
              _ActionButton(
                icon: Icons.share,
                label: 'SHARE',
                color: const Color(0xFF2EAF7D),
                onPressed: () => _showMessage(
                  context,
                  'Sharing Rajang River Express Cruise…',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
