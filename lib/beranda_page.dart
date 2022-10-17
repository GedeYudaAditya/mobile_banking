import 'package:flutter/material.dart';
import 'package:mobile_banking/components/beranda_widget.dart';
import 'package:mobile_banking/components/beranda_widget_desktop.dart';
import 'package:mobile_banking/components/bottom_bar_widget.dart';
import 'package:mobile_banking/components/bottom_bar_widget_beranda.dart';
import 'package:mobile_banking/components/contact_wiget.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: BerandaWidgetDesktop(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ContactWidget(),
                )
              ],
            );
          } else {
            return const Center(child: BerandaWidget());
          }
        },
      ),
      bottomNavigationBar: const BottomBarWidgetBeranda(),
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
