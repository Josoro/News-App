import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/repositories/news_repository.dart';
import 'package:news_app/src/theme/my_theme.dart';

import 'src/bloc/bloc/news_api_bloc.dart';
import 'src/routes/routes.dart';
import 'src/screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatefulWidget {
  const AppState({super.key});

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
            create: (context) =>
                NewsBloc(NewsRepository())..add(LoadUserEvent()))
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: myTheme,
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
