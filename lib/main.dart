import 'package:flutter/material.dart';
import 'package:flutter_lernkarten_app_test/core/common/app_theme/app_theme.dart';
import 'package:flutter_lernkarten_app_test/features/decks/data/data_sources/local/decks_database.dart';
import 'package:flutter_lernkarten_app_test/features/decks/presentation/pages/decks_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DecksDatabase().init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Flashcards Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const DecksListPage(),
    );
  }
}
