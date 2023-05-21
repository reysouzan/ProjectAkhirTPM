import 'package:flutter/material.dart';

class KonversiUangPage extends StatefulWidget {
  const KonversiUangPage({Key? key}) : super(key: key);

  @override
  State<KonversiUangPage> createState() => _KonversiUangPageState();
}

class _KonversiUangPageState extends State<KonversiUangPage> {
  late String choose1;
  late String choose2;
  late String _result;
  late double temp;

  late String _jumlah;

  @override
  void initState() {
    super.initState();
    choose1 = 'IDR';
    choose2 = 'IDR';
    _result = '';
    _jumlah = '';
    temp = 0;
  }

  void _hasil() {
    if (choose1 == 'IDR' && choose2 == 'USD') {
      setState(() {
        temp = double.parse(_jumlah) / 14200;
        _result = temp.toStringAsFixed(4);
      });
    } else if (choose1 == 'USD' && choose2 == 'IDR') {
      setState(() {
        temp = double.parse(_jumlah) * 14200;
        _result = temp.toStringAsFixed(4);
      });
    } else if (choose1 == 'USD' && choose2 == 'USD') {
      setState(() {
        temp = double.parse(_jumlah);
        _result = temp.toStringAsFixed(4);
      });
    } else if (choose1 == 'IDR' && choose2 == 'IDR') {
      setState(() {
        temp = double.parse(_jumlah);
        _result = temp.toStringAsFixed(4);
      });
    } else if (choose1 == 'IDR' && choose2 == 'EUR') {
      setState(() {
        temp = double.parse(_jumlah) / 17200; // Ubah nilai konversi sesuai dengan nilai tukar IDR ke EUR
        _result = temp.toStringAsFixed(4);
      });
    } else if (choose1 == 'EUR' && choose2 == 'IDR') {
      setState(() {
        temp = double.parse(_jumlah) * 17200; // Ubah nilai konversi sesuai dengan nilai tukar EUR ke IDR
        _result = temp.toStringAsFixed(4);
      });
    } else if (choose1 == 'IDR' && choose2 == 'MYR') {
      setState(() {
        temp = double.parse(_jumlah) / 3300; // Ubah nilai konversi sesuai dengan nilai tukar IDR ke MYR
        _result = temp.toStringAsFixed(4);
      });
    } else if (choose1 == 'MYR' && choose2 == 'IDR') {
      setState(() {
        temp = double.parse(_jumlah) * 3300; // Ubah nilai konversi sesuai dengan nilai tukar MYR ke IDR
        _result = temp.toStringAsFixed(4);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2D6A4F),
    body: SafeArea(
    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
    children: [
    const SizedBox(
    height: 15,
    ),
    TextField(
    style: const TextStyle(color:
    Colors.white),
      onChanged: (value) {
        setState(() {
          _jumlah = value;
        });
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        labelText: "Input Jumlah Uang",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            dropdownColor: Colors.black,
            value: choose1,
            items: <String>['IDR', 'USD', 'EUR', 'MYR'].map(
                  (String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                choose1 = value ?? 'IDR';
              });
            },
          ),
          DropdownButton<String>(
            dropdownColor: Colors.black,
            value: choose2,
            items: <String>['IDR', 'USD', 'EUR', 'MYR'].map(
                  (String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                choose2 = value ?? 'IDR';
              });
            },
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF52B788),
          padding: const EdgeInsets.symmetric(horizontal: 100),
        ),
        onPressed: () {
          print(choose1);
          print(choose2);
          print(_jumlah);
          _hasil();
        },
        child: const Text("Convert"),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        _result,
        style: TextStyle(fontSize: 20, color: Colors.white),
      )
    ],
    ),
    ),
    ),
    );
  }
}
