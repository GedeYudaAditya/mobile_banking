import 'package:flutter/material.dart';
import 'package:mobile_banking/beranda_page.dart';
import 'package:mobile_banking/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Banking',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        '/': (context) => const HomePage(title: 'Koprasi Undiksha'),
        '/beranda': (context) => const BerandaPage(title: 'Koprasi Undiksha'),
      },
      initialRoute: '/',
    );
  }
}
