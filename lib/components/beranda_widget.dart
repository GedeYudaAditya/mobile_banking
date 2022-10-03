import 'package:flutter/material.dart';

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
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            // horizontal: MediaQuery.of(context).size.width * 0.025,
            horizontal: hitungPersentase(MediaQuery.of(context).size.width, 3),
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
              // Image.asset(
              //   'images/normal.gif',
              //   width: 120,
              // ),
              Container(
                height: 120,
                width: hitungPersentase(MediaQuery.of(context).size.width, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('images/normal.gif'),
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
                    width:
                        hitungPersentase(MediaQuery.of(context).size.width, 60),
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nasabah',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Gede Yuda Aditya',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    // height: 50,
                    width:
                        hitungPersentase(MediaQuery.of(context).size.width, 60),
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Saldo Anda',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp. 1.200.000',
                          style: TextStyle(
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
        SizedBox(
          height: 20,
        ),
        Container(
          height: hitungPersentase(MediaQuery.of(context).size.height, 48),
          margin: EdgeInsets.symmetric(
            horizontal: hitungPersentase(MediaQuery.of(context).size.width, 3),
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
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      size: 50,
                      color: Color.fromARGB(255, 65, 33, 243),
                    ),
                    const Text(
                      "Cek Saldo",
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 33, 243),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.money,
                      size: 50,
                      color: Color.fromARGB(255, 65, 33, 243),
                    ),
                    const Text(
                      "Transfer",
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 33, 243),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_money,
                      size: 50,
                      color: Color.fromARGB(255, 65, 33, 243),
                    ),
                    const Text(
                      "Deposito",
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 33, 243),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: 50,
                      color: Color.fromARGB(255, 65, 33, 243),
                    ),
                    const Text(
                      "Pembayaran",
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 33, 243),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.monitor_weight,
                      size: 50,
                      color: Color.fromARGB(255, 65, 33, 243),
                    ),
                    const Text(
                      "Peminjaman",
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 33, 243),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance,
                      size: 50,
                      color: Color.fromARGB(255, 65, 33, 243),
                    ),
                    const Text(
                      "Cek Mutasi",
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 33, 243),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Butuh Bantuan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text('0878-1234-1024',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                child: Icon(
                  Icons.phone,
                  size: 100,
                  color: Color.fromARGB(255, 65, 33, 243),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
