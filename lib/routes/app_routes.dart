import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {

  static String initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {

      'home' : ( BuildContext ) => const HomeScreen(),
      'details' : ( BuildContext ) => const DetailsScreen()

  };

}