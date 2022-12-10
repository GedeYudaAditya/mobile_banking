import 'package:flutter/material.dart';
import 'package:mobile_banking/components/bottom_bar_widget.dart';
import 'package:mobile_banking/service/list_users_service.dart';

import 'model/list_users_model.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final _services = ListUsersService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png', width: 200),
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.indigo),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        gapPadding: 2.0,
                      ),
                      hintText: 'Masukan Nama Lengkap',
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        gapPadding: 2.0,
                      ),
                      hintText: 'Masukkan Email',
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Password',
                    ),
                    obscureText: true,
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _passwordConfirmController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Kembali Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Ni yang baru, pakai service
                      Future<ListUsersModel?> result = _services.registerUsers(
                        email: _emailController.text,
                        name: _usernameController.text,
                        password: _passwordController.text,
                      );

                      // print(result);

                      result.then((value) {
                        if (value != null) {
                          // kalau berhasil login
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/beranda', (route) => false,
                              // ngepasing data ke halaman beranda pakai arguments
                              arguments: value);
                        } else {
                          // kalau gagal login
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Terjadi Kesalahan'),
                            ),
                          );
                        }
                      });
                    },
                    child: const SizedBox(
                      width: 100,
                      child: Text(
                        'Daftar',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Sudah Punya Akun?'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
