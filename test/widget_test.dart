// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mystudentflat2/main.dart';

void main() {
  testWidgets('Test example', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Vérifie que le texte "Interface Application MyStudentFlat" est présent.
    expect(find.text('Interface Application MyStudentFlat'), findsOneWidget);

    // Simule un appui sur le bouton d'ajout.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Vérifie que le texte "1" est présent.
    expect(find.text('1'), findsOneWidget);
  });
}
