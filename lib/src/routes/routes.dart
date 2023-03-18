import 'package:flutter/material.dart';

import '../screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  BodyScreen.routeName: (context) => const BodyScreen(),
};
