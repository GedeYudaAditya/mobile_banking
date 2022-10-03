import 'package:flutter/material.dart';
import 'package:mobile_banking/components/beranda_widget.dart';
import 'package:mobile_banking/components/bottom_bar_widget.dart';
import 'package:mobile_banking/components/bottom_bar_widget_beranda.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: const Center(
        child: BerandaWidget(),
      ),
      bottomNavigationBar: BottomBarWidgetBeranda(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/scan');
        },
        tooltip: 'Transfer',
        child: const Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
