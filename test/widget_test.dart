import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab03_rajang_river_cruise/main.dart';

void main() {
  testWidgets('star count increases when the star is tapped', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const RajangRiverCruiseApp());

    expect(find.text('Rajang River Express Cruise'), findsOneWidget);
    expect(find.text('CALL'), findsOneWidget);
    expect(find.text('ROUTE'), findsOneWidget);
    expect(find.text('SHARE'), findsOneWidget);
    expect(find.text('41'), findsOneWidget);

    await tester.tap(find.byTooltip('Tap to increase star count'));
    await tester.pump();

    expect(find.text('42'), findsOneWidget);
    expect(find.text('Visit Date'), findsOneWidget);
    expect(find.text('Dark Mode'), findsOneWidget);
    expect(find.text('Sunset Cruise'), findsOneWidget);
  });
}
