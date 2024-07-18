import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String locale = 'en';
  void changeLocale() {
    setState(() {
      locale = locale == 'en' ? 'ne' : 'en';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(locale),
      title: 'Flutter Demo',
      // Provide the generated AppLocalizations to the MaterialApp. This allows
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(locale: locale, changeLocale: changeLocale),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.locale, required this.changeLocale});
  final String locale;
  final Function changeLocale;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "${AppLocalizations.of(context)!.hello} ${AppLocalizations.of(context)!.world}"),
            TextButton(
              onPressed: () {
                widget.changeLocale();
              },
              child: const Text("Change To "),
            ),
          ],
        ),
      ),
    );
  }
}
