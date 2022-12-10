import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_banking/components/beranda_widget.dart';
import 'package:mobile_banking/components/beranda_widget_desktop.dart';
import 'package:mobile_banking/components/bottom_bar_widget.dart';
import 'package:mobile_banking/components/bottom_bar_widget_beranda.dart';
import 'package:mobile_banking/components/contact_wiget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mobile banking Undiksha'),
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
        onPressed: () => scanQR(),
        tooltip: 'Transfer',
        child: const Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // print(barcodeScanRes);

      // open barcodeScanRes to browser

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
}
