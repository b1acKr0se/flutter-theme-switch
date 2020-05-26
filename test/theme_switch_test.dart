import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theme_switch/theme_switch.dart';

void main() {
  testWidgets('Initialize state is 0', (WidgetTester tester) async {
    // Test code goes here.
    const Key themeSwitcherKey = Key('theme_switcher');
    await tester.pumpWidget(ThemeSwitch(
        key: themeSwitcherKey, width: 100, height: 50, onChanged: (val) {}));
    final StatefulElement element =
        tester.element(find.byKey(themeSwitcherKey));
    final ThemeSwitchState themeSwitcherState =
        element.state as ThemeSwitchState;
    expect(themeSwitcherState.currentState, equals(0));
  });

  testWidgets('State changed after tapped', (WidgetTester tester) async {
    // Test code goes here.
    const Key themeSwitcherKey = Key('theme_switcher');
    await tester.pumpWidget(ThemeSwitch(
        key: themeSwitcherKey, width: 100, height: 50, onChanged: (val) {}));
    final StatefulElement element =
        tester.element(find.byKey(themeSwitcherKey));
    final ThemeSwitchState themeSwitcherState =
        element.state as ThemeSwitchState;

    await tester
        .tap(find.byWidget(tester.firstWidget(find.byType(AnimatedOpacity))));
    await tester.pumpAndSettle(Duration(milliseconds: 500));

    expect(themeSwitcherState.currentState, equals(1));
  });

  testWidgets('Widget has correct state', (WidgetTester tester) async {
    // Test code goes here.
    const Key themeSwitcherKey = Key('theme_switcher');
    await tester.pumpWidget(ThemeSwitch(
        key: themeSwitcherKey, width: 100, height: 50, onChanged: (val) {}));

    final firstOpacity =
        tester.firstWidget(find.byType(AnimatedOpacity)) as AnimatedOpacity;
    final secondOpacity = tester
        .widgetList(find.byType(AnimatedOpacity))
        .toList()[1] as AnimatedOpacity;

    expect(firstOpacity.opacity, equals(0));
    expect(secondOpacity.opacity, equals(1));
  });

  testWidgets('Opacity changed after tapped', (WidgetTester tester) async {
    // Test code goes here.
    const Key themeSwitcherKey = Key('theme_switcher');
    await tester.pumpWidget(ThemeSwitch(
        key: themeSwitcherKey, width: 100, height: 50, onChanged: (val) {}));

    await tester
        .tap(find.byWidget(tester.firstWidget(find.byType(AnimatedOpacity))));
    await tester.pumpAndSettle(Duration(milliseconds: 1000));

    final firstOpacity =
        tester.firstWidget(find.byType(AnimatedOpacity)) as AnimatedOpacity;

    final secondOpacity = tester
        .widgetList(find.byType(AnimatedOpacity))
        .toList()[1] as AnimatedOpacity;

    expect(firstOpacity.opacity, equals(1));
    expect(secondOpacity.opacity, equals(0));
  });
}
