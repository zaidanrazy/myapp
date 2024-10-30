import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart'; // ganti 'my_app' sesuai nama proyek Anda

void main() {
  testWidgets('Test widget tampilan awal aplikasi', (WidgetTester tester) async {
    // Membuka aplikasi
    await tester.pumpWidget(MyApp());

    // Memastikan tampilan awal berisi widget 'Login'
    expect(find.text('Login'), findsOneWidget);

    // Memasukkan email dan password untuk simulasi login
    await tester.enterText(find.byKey(const Key('emailField')), 'user@example.com');
    await tester.enterText(find.byKey(const Key('passwordField')), 'password123');

    // Tekan tombol login
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    // Memastikan berada di halaman utama setelah login
    expect(find.text('Aplikasi Sosial'), findsOneWidget);
    expect(find.text('Jurnal Kesadaran Sosial'), findsOneWidget);
  });
}
