import 'package:flutter/material.dart';
import 'package:news_app/view/screens/details_screen.dart';
import 'package:news_app/view/screens/home_screen.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
void main() {
  runApp(const NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: .light,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.details :(context) => DetailsScreen()
      },
    );
  }
}