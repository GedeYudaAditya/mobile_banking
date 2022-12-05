import 'package:flutter/material.dart';
import 'package:mobile_banking/model/list_users_model.dart';
import 'package:mobile_banking/service/list_users_service.dart';

class ListUserPage extends StatefulWidget {
  ListUserPage({Key? key}) : super(key: key);

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  //1. buat variabel list user model
  List<ListUsersModel> _listUser = [];

  //2. buat fungsi get data user
  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then((value) {
      setState(() {
        // print(_listUser);
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
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data.avatar!),
              ),
              title: Text(data.firstName!),
              subtitle: Text(data.email!),
              trailing: Text(data.id.toString()),
            );
          },
        ),
      ),
    );
  }
}
