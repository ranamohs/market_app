part of 'navigation.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  /// Navigate to a specific route.
  static Future<dynamic> navigateTo(
    String routeName, {
    dynamic arguments,
    Map<String, dynamic>? map,
    bool replace = false,
    bool clean = false,
  }) async {
    final currentState = navigatorKey.currentState;
    if (currentState == null) {
      throw Exception("Navigator state is not initialized.");
    }

    if (clean) {
      return currentState.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }


    if (replace) {
      return currentState.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    }


    return currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Go back to the previous route.
  static void goBack() {
    final currentState = navigatorKey.currentState;
    if (currentState != null && currentState.canPop()) {
      currentState.pop();
    } else {
      throw Exception(
          "Cannot go back - Navigator state is not available or there are no routes to pop.");
    }
  }

  /// Generate routes based on the route settings.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.HOME:
        return MaterialPageRoute(builder: (_) => const HomeView());






      default:
        return MaterialPageRoute(builder: (_) => const App());
    }
  }
}
