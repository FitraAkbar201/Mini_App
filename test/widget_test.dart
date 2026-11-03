import 'package:flutter_test/flutter_test.dart';
import 'package:mini_app/main.dart';

void main() {
  testWidgets('Mini Stok menampilkan Dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MiniApp());

    expect(find.text('Mini Stok'), findsOneWidget);
    expect(find.text('Selamat Datang!'), findsOneWidget);
    expect(find.text('Daftar Barang'), findsNothing);
  });
}
