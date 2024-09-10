import 'package:go_router/go_router.dart';

import '../main.dart';
import '../shared/constants.dart';

final appRouter = GoRouter(
    // initialLocation: AddSiteView.path,
    navigatorKey: appNavigationKey,
    routes: [
      GoRoute(path: '/', builder: (_, __) => const App()),
    ]);
