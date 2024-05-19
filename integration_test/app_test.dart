import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lab5/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final mainPhone = find.byKey(const Key("mainPhone"));
      var firstCheckbox = find.byType(Checkbox).first;
      final getOTPButton = find.byKey(const Key("getOTPButton"));
      final typeOTP = find.byKey(const Key("typeOTP"));
      final activateButton = find.byKey(const Key("activateButton"));
      final factory1 = find.byKey(const Key("factory1"));
      final factory2 = find.byKey(const Key("factory2"));
      final factory3 = find.byKey(const Key("factory3"));

      final typePressure = find.byKey(const Key("typePressure"));
      final typeFlow = find.byKey(const Key("typeFlow"));
      final typeLevel = find.byKey(const Key("typeLevel"));
      final typePower = find.byKey(const Key("typePower"));
      final editButton = find.byKey(const Key("editButton"));

      final addButton = find.byKey(const Key("addButton"));
      final typeName = find.byKey(const Key("typeName"));
      final typePhone = find.byKey(const Key("typePhone"));
      final submitButton = find.byKey(const Key("submitButton"));

      await tester.enterText(mainPhone, "123456789");
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      expect(
        tester.getSemantics(firstCheckbox),
        matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: false,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true),
      );
      await tester.tap(firstCheckbox);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));

      await tester.ensureVisible(getOTPButton);
      await tester.tap(getOTPButton);
      await tester.pumpAndSettle();

      await tester.enterText(typeOTP, "123456");
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.ensureVisible(activateButton);
      await tester.tap(activateButton);
      await tester.pumpAndSettle();

      await tester.ensureVisible(factory1);
      await tester.tap(factory1);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.ensureVisible(factory3);
      await tester.tap(factory3);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.byKey(const Key('personIcon')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('homeIcon')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('settingIcon')));
      await tester.pumpAndSettle();

      await tester.tap(factory2);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.enterText(typePressure, "20");
      await tester.pumpAndSettle();
      await tester.enterText(typeFlow, "40");
      await tester.pumpAndSettle();
      await tester.enterText(typeLevel, "60");
      await tester.pumpAndSettle();
      await tester.enterText(typePower, "80");
      await tester.pumpAndSettle();

      await tester.ensureVisible(editButton);
      await tester.tap(editButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.byKey(const Key('homeIcon')));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.ensureVisible(factory1);
      await tester.tap(factory1);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.ensureVisible(factory3);
      await tester.tap(factory3);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(factory2);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.byKey(const Key('personIcon')));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.ensureVisible(addButton);
      await tester.tap(addButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.enterText(typeName, "Phoo");
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.enterText(typePhone, "123456789");
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.ensureVisible(submitButton);
      await tester.tap(submitButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
