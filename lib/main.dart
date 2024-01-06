import 'package:flutter/material.dart';
import 'package:government_services_app/modules/provider/gov_ser_provider.dart';
import 'package:government_services_app/modules/view/detailpage/detail_page.dart';
import 'package:government_services_app/screen/home_page.dart';
import 'package:government_services_app/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GovSerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        initialRoute: 'splash_screen',
        routes: {
          '/': (context) => const Home_Page(),
          'DetailPage': (context) => const DetailPage(),
          'splash_screen': (context) => const Splash_Screen(),
        },
      ),
    );
  }
}
