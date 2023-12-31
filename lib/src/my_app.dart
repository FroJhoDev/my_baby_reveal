import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/styles/app_theme.dart';
import 'core/flavors/flavor_config.dart';
import 'core/providers/app_providers.dart';

import 'features/voting/pages/home_page_family/home_page_family.dart';
import 'features/voting/pages/home_page_parents/home_page_parents.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Baby Reveal',
        theme: AppTheme.themeData,
        home: FlavorConfig.shared.flavor == FlavorProducts.family
            ? const HomePageFamily()
            : HomePageParents(),
      ),
    );
  }
}
