import 'package:flutter_test/flutter_test.dart';
import 'package:electronic_grader/app.dart';

void main() {
  testWidgets('يعرض التطبيق لوحة التحكم باللغة العربية', (tester) async {
    await tester.pumpWidget(const ElectronicGraderApp());
    await tester.pumpAndSettle();

    expect(find.text('المصحح الإلكتروني'), findsOneWidget);
    expect(find.text('لوحة التحكم'), findsOneWidget);
    expect(find.text('عدد الاختبارات'), findsOneWidget);
  });
}
