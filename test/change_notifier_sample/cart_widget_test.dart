// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:study_flutter/change_notifier_sample/lib/models/cart.dart';
import 'package:study_flutter/change_notifier_sample/lib/models/catalog.dart';

CartModel? cartModel;
CatalogModel? catalogModel;

void main() {
  // group('CartScreen widget tests', () {
  //   testWidgets('Tapping BUY button displays snackbar.', (tester) async {
  //     await tester.pumpWidget(createCartScreen());
  //
  //     // Verify no snackbar initially exists.
  //     expect(find.byType(SnackBar), findsNothing);
  //     await tester.tap(find.text('BUY'));
  //     // Schedule animation.
  //     await tester.pump();
  //     // Verifying the snackbar upon clicking the button.
  //     expect(find.byType(SnackBar), findsOneWidget);
  //   });
  //
  //   testWidgets('Testing when the cart contains items', (tester) async {
  //     await tester.pumpWidget(createCartScreen());
  //
  //     // Adding five items in the cart and testing.
  //     for (var i = 0; i < 5; i++) {
  //       var item = catalogModel!.getByPosition(i);
  //       cartModel!.add(item);
  //       await tester.pumpAndSettle();
  //       expect(find.text(item.name), findsOneWidget);
  //     }
  //
  //     // Testing total price of the five items.
  //     expect(find.text('\$${42 * 5}'), findsOneWidget);
  //     expect(find.byIcon(Icons.done), findsNWidgets(5));
  //   });
  // });

  group('CartModel test', () {
    test('adding item increases total cost', () {
      final cart = CartModel();
      cart.catalog = CatalogModel();
      final startingPrice = cart.totalPrice;
      cart.addListener(() {
        expect(cart.totalPrice, greaterThan(startingPrice));
      });
      cart.add(Item(1, 'Dash'));
    });
  });
}
