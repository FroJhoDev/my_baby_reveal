import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/styles/app_theme.dart';
import 'core/providers/app_providers.dart';

import 'features/voting/pages/home_page/home_page.dart';

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
        home: const HomePage(),
      ),
    );
  }
}
