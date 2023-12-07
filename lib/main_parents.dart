import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'src/core/flavors/flavor_config.dart';
import 'src/my_app.dart';

void main() async {
  FlavorConfig.create(appName: 'MyBabyRevealParents', flavor: FlavorProducts.parents);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
