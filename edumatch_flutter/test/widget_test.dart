import 'package:flutter_test/flutter_test.dart';

import 'package:edumatch/main.dart';

void main() {
  testWidgets('Muestra la pantalla de bienvenida y entra al menú principal',
      (WidgetTester tester) async {
    await tester.pumpWidget(const EduMatchApp());

    expect(find.text('EduMatch'), findsOneWidget);
    expect(find.text('Comenzar'), findsOneWidget);

    await tester.tap(find.text('Comenzar'));
    await tester.pumpAndSettle();

    expect(find.text('Explorar oportunidades'), findsOneWidget);
    expect(find.text('Mis postulaciones'), findsOneWidget);
  });
}
