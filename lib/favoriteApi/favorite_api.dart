import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favor_market_model.dart';
import 'market_list.dart';
import 'favour_market.dart';
import 'market_list_model.dart';
import 'theme.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(builder: (context) => MarketListModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<MarketListModel, FavouriteModel>(
            builder: (context, catalog, previousCart) =>
                FavouriteModel(catalog, previousCart)),
      ],
      child: MaterialApp(
        title: 'Provider',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => FavouriteMarket(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
