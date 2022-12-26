import 'package:flutter/material.dart';
import 'package:mobile_banking/service/list_users_service.dart';

class TarikPage extends StatefulWidget {
  TarikPage({Key? key}) : super(key: key);

  @override
  State<TarikPage> createState() => _TarikPageState();
}

class _TarikPageState extends State<TarikPage> {
  final _formKey = GlobalKey<FormState>();

  final _jumlahTarik = TextEditingController();

  final _service = ListUsersService();

  @override
  Widget build(BuildContext context) {
    var userId = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarik Uang'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Halaman Tarik',
            style: TextStyle(fontSize: 30),
          ),
          TextFormField(
            controller: _jumlahTarik,
            decoration: const InputDecoration(
              labelText: 'Jumlah Tarik',
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
              var data = await _service.setTarik(userId, _jumlahTarik.text);
              print(data);
              if (data['status'] == 'success') {
                print(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tarik Berhasil'),
                  ),
                );
              } else {
                print(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tarik Gagal'),
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
