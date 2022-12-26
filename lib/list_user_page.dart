import 'package:flutter/material.dart';
import 'package:mobile_banking/model/list_users_model.dart';
import 'package:mobile_banking/service/list_users_service.dart';
import 'package:mobile_banking/service/shared_preference_service.dart';

class ListUserPage extends StatefulWidget {
  ListUserPage({Key? key}) : super(key: key);

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  //1. buat variabel list user model
  List<ListUsersModel> _listUser = [];
  // List<ListUsersModel> _listUser = [];


  //2. buat fungsi get data user
  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then((value) {
      setState(() {
        _listUser = value!;
      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    // print(_listUser);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _listUser.length,
          itemBuilder: (context, index) {
            ListUsersModel data = _listUser[index];
            print(data.nama);
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://reqres.in/img/faces/${data.user_id!}-image.jpg'),
              ),
              title: Text(data.nama!),
              subtitle: Text(data.username!),
              trailing: Text(data.user_id!.toString()),
              onTap: () {
                Navigator.pushNamed(context, '/transfer',
                    arguments: data.user_id);
              },
            );
          },
        ),
      ),
    );
  }
}
