import 'package:flutter/material.dart';
import 'package:flutter_notes/screens/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login page menampilkan form email + password', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginPage()),
    );

    expect(find.text('LOGIN FIREBASE'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets('Submit kosong menampilkan error validasi', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginPage()),
    );

    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    expect(find.text('Email wajib diisi'), findsOneWidget);
    expect(find.text('Password wajib diisi'), findsOneWidget);
  });

  testWidgets('Email tidak valid menampilkan error format', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginPage()),
    );

    await tester.enterText(find.byType(TextFormField).first, 'bukan-email');
    await tester.enterText(find.byType(TextFormField).last, '123456');
    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    expect(find.text('Format email tidak valid'), findsOneWidget);
  });

  testWidgets('Password kurang dari 6 karakter menampilkan error',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginPage()),
    );

    await tester.enterText(
      find.byType(TextFormField).first,
      'andi@example.com',
    );
    await tester.enterText(find.byType(TextFormField).last, '123');
    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    expect(find.text('Password minimal 6 karakter'), findsOneWidget);
  });
}
