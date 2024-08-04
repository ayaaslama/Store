import 'package:flutter/material.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/features/pages/home_page.dart';

void main() {
  runApp(StoreApp(
    appRouter: AppRouter(),
  ));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
