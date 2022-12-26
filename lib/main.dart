import 'package:flutter/material.dart';
import 'package:mobile_banking/beranda_page.dart';
import 'package:mobile_banking/home_page.dart';
import 'package:mobile_banking/register_page.dart';
import 'package:mobile_banking/service/list_users_service.dart';
import 'package:mobile_banking/service/shared_preference_service.dart';
import 'package:mobile_banking/setoran_page.dart';
import 'package:mobile_banking/tarik_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ListSharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(600, name: 'Midle'),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      title: 'Mobile Banking',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        '/': (context) => const HomePage(title: 'Koprasi Undiksha'),
        '/register': (context) => RegisterPage(),
        '/beranda': (context) => const BerandaPage(title: 'Koprasi Undiksha'),
        '/transfer': (context) => SetoranPage(),
        '/tarik': (context) => TarikPage(),
      },
      initialRoute: '/',
    );
  }

  getUsers() {
    ListUsersService _service = ListUsersService();
    _service.getDataUsers();
  }
}
