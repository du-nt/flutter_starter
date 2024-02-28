import 'package:fl_query/fl_query.dart';
import 'package:fl_query_connectivity_plus_adapter/fl_query_connectivity_plus_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/helpers/injection_container.dart';
import 'package:flutter_starter/todos/views/list_of_todos.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:signals/signals_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'stores/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QueryClient.initialize(
    cachePrefix: 'fl_query',
    connectivity: FlQueryConnectivityPlusAdapter(),
  );

  initializeDependencies();
  await initializeTheme();

  runApp(
    QueryClientProvider(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: themeMode.watch(context),
      theme: ThemeData(
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      home: const TodoList(),
    );
  }
}
