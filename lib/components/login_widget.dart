import 'package:dio/src/form_data.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking/model/list_users_model.dart';
import 'package:mobile_banking/service/list_users_service.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _services = ListUsersService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/logo.png', width: 200),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
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
                    hintText: 'Yuda Aditya',
                  ),
                ),
                const Divider(),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    hintText: '********',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Ni yang lama, cuma pakai if else
                    // if (_usernameController.text == 'yuda' &&
                    //     _passwordController.text == '123') {
                    //   Navigator.pushNamedAndRemoveUntil(
                    //       context, '/beranda', (route) => false);
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Username atau Password salah'),
                    //     ),
                    //   );
                    // }

                    // Ni yang baru, pakai service
                    Future<ListUsersModel?> result = _services.loginUsers(
                      email: _usernameController.text,
                      password: _passwordController.text,
                    );

                    // print(result);

                    result.then((value) {
                      if (value != null) {
                        // kalau berhasil login
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/beranda', (route) => false,
                            arguments: value);
                      } else {
                        // kalau gagal login
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Username atau Password salah'),
                          ),
                        );
                      }
                    });
                  },
                  child: const SizedBox(
                    width: 100,
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Daftar Mbanking'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('lupa password?'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
