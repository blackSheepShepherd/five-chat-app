import 'package:five_chat_app/app/app.dart';
import 'package:five_chat_app/login/view/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
