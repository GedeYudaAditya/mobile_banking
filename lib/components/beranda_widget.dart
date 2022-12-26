import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_banking/components/grid_view_widget.dart';
import 'package:mobile_banking/model/list_users_model.dart';
import 'package:mobile_banking/service/shared_preference_service.dart';

class BerandaWidget extends StatefulWidget {
  const BerandaWidget({Key? key}) : super(key: key);

  @override
  State<BerandaWidget> createState() => _BerandaWidgetState();
}

class _BerandaWidgetState extends State<BerandaWidget> {
  // Fungsi untuk menghitung hasil nilai dari persentase sebuah total nilai
  double hitungPersentase(double total, double persentase) {
    return total * persentase / 100;
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data yang di pasing dari halaman sebelumnya
    var user = ModalRoute.of(context)!.settings.arguments;

    // Ubah data yang di dapat dari json ke model
    ListUsersModel myUser = user as ListUsersModel;

    if (myUser.nama == null) {
      Navigator.pushReplacementNamed(context, '/');
    }
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              // horizontal: MediaQuery.of(context).size.width * 0.025,
              horizontal:
                  hitungPersentase(MediaQuery.of(context).size.width, 3),
            ),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 120,
                  width:
                      hitungPersentase(MediaQuery.of(context).size.width, 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      // Pakai data dari model
                      image: NetworkImage(
                          'https://reqres.in/img/faces/${myUser.user_id}-image.jpg'),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      // height: 50,
                      width: hitungPersentase(
                          MediaQuery.of(context).size.width, 60),
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nasabah',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            // Pakai data dari model
                            myUser.nama!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      // height: 50,
                      width: hitungPersentase(
                          MediaQuery.of(context).size.width, 60),
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Saldo Anda',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${myUser.saldo!}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            // height: hitungPersentase(MediaQuery.of(context).size.height, 48),
            margin: EdgeInsets.symmetric(
              horizontal:
                  hitungPersentase(MediaQuery.of(context).size.width, 3),
            ),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
            child: GridViewWidget(id: myUser.user_id),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: hitungPersentase(MediaQuery.of(context).size.height, 5),
            ),
            padding: const EdgeInsets.all(10),
            color: Colors.teal[100],
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Butuh Bantuan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('0878-1234-1024',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                const Icon(
                  Icons.phone,
                  size: 100,
                  color: const Color.fromARGB(255, 65, 33, 243),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
