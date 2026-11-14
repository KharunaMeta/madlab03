import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';

/// PreferenceSection: visit date, cruise package, and theme switch.
class PreferenceSection extends StatelessWidget {
  const PreferenceSection({super.key, required this.viewModel});

  final CruiseBookingViewModel viewModel;

  Future<void> _pickVisitDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: viewModel.visitDate,
      firstDate: DateTime(2026),
      lastDate: DateTime(2028),
      helpText: 'Select visit date',
    );
    if (picked != null) {
      viewModel.setVisitDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final cardColor = theme.cardTheme.color;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trip Preferences',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: cardColor,
            elevation: 1,
            shadowColor: Colors.black26,
            borderRadius: BorderRadius.circular(18),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                InkWell(
                  onTap: () => _pickVisitDate(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: scheme.primary,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Visit Date',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          viewModel.formattedVisitDate,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Icon(Icons.chevron_right, color: scheme.outline),
                      ],
                    ),
                  ),
                ),
                Divider(color: scheme.outlineVariant),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 12, 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.sailing_outlined,
                          color: Color(0xFF2EAF7D),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cruise Package',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: viewModel.selectedPackage,
                                isExpanded: true,
                                isDense: true,
                                borderRadius: BorderRadius.circular(12),
                                items: [
                                  for (final package
                                      in CruiseBookingViewModel.cruisePackages)
                                    DropdownMenuItem(
                                      value: package,
                                      child: Text(
                                        package,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    viewModel.setPackage(value);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: scheme.outlineVariant),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                  child: Row(
                    children: [
                      Icon(Icons.dark_mode_outlined, color: scheme.primary),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dark Mode',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Switch between light and dark theme',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: viewModel.isDarkMode,
                        onChanged: viewModel.setDarkMode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
