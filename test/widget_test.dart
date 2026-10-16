import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_calculator/main.dart';

void main() {
  testWidgets('calculator opens with a zero display and its controls', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const CalculatorApp());

    expect(find.text('Simple Calculator'), findsOneWidget);
    expect(find.text('0'), findsWidgets);
    for (final label in ['AC', '⌫', '÷', '×', '−', '+', '=', '.', '%']) {
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('calculator adds two numbers and clears the result', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const CalculatorApp());

    await tester.tap(find.text('1'));
    await tester.tap(find.text('2'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('3'));
    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.text('15.0'), findsOneWidget);

    await tester.tap(find.text('AC'));
    await tester.pump();
    expect(find.text('0'), findsWidgets);
  });
}
