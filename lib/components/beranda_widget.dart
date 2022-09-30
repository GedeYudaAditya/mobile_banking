import 'package:flutter/material.dart';

class BerandaWidget extends StatefulWidget {
  const BerandaWidget({Key? key}) : super(key: key);

  @override
  State<BerandaWidget> createState() => _BerandaWidgetState();
}

class _BerandaWidgetState extends State<BerandaWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
              Image.asset(
                'images/normal.gif',
                width: 80,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Gede Yuda Aditya',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '2.000.000',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
