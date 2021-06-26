import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/user_feed.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';

import '../../../mock_data.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('FeedItemComponent', () {
    testWidgets('widgets are rendered correctly ', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemComponent(feedItem: mockFeedItem);
            }),
          ),
        )));
        expect(find.byType(FeedItemTitleBar), findsOneWidget);
        expect(find.byType(FeedItemBody), findsOneWidget);
        await tester.tap(find.byKey(feedItemInkWell));
        await tester.pump(const Duration(seconds: 3));
      });
    });

    testWidgets('widgets are rendered correctly without video links',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemComponent(feedItem: mockFeedItem2);
            }),
          ),
        )));
        expect(find.byType(FeedItemTitleBar), findsOneWidget);
        expect(find.byType(FeedItemBody), findsOneWidget);
        await tester.tap(find.byKey(feedItemInkWell));
        await tester.pump(const Duration(seconds: 3));
      });
    });
  });
}
