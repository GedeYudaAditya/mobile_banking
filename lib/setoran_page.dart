import 'package:flutter/material.dart';
import 'package:mobile_banking/service/list_users_service.dart';

class SetoranPage extends StatefulWidget {
  SetoranPage({Key? key}) : super(key: key);

  @override
  State<SetoranPage> createState() => _SetoranPageState();
}

class _SetoranPageState extends State<SetoranPage> {
  final _formKey = GlobalKey<FormState>();

  final _jumlahSetoran = TextEditingController();

  final _service = ListUsersService();

  @override
  Widget build(BuildContext context) {
    var userId = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stor Uang'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Halaman Setoran',
            style: TextStyle(fontSize: 30),
          ),
          TextFormField(
            controller: _jumlahSetoran,
            decoration: const InputDecoration(
              labelText: 'Jumlah Setoran',
              border: OutlineInputBorder(
                gapPadding: 2.0,
              ),
              hintText: 'Rp. 100.000',
            ),
          ),
          const Divider(),
          ElevatedButton(
            key: _formKey,
            onPressed: () async {
              var data = await _service.setSetoran(userId, _jumlahSetoran.text);
              print(data);
              if (data['status'] == 'success') {
                print(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Setoran Berhasil'),
                  ),
                );
              } else {
                print(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Setoran Gagal'),
                  ),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      )),
    );
  }
}
