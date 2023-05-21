import 'package:flutter/material.dart';

class ProfilDetail extends StatelessWidget {
  const ProfilDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Profil"),
        ),
        body: Column(
          children: [
            _imageField(),
          ],
        ),
      ),
    );
  }

  Widget _imageField() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/profil.jpg"),
            radius: 50,
          ),
          Text(
            "Nama Saya Reytama Syahdewa Purba. Saya lagi menempuh perkuliahan di UPN \"Veteran\" Yogyakarta di Program Studi Informatika. Saya memiliki NIM 123200021. Aku mengambil salah satu Mata Kuliah, yaitu Teknologi Pemrograman Mobile IF-B. Aku lahir di Simalungun, 06 Oktober 2002. Aku pengen jadi orang kaya.",
            style: TextStyle(
                fontSize: 14,
                height: 2,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      margin: EdgeInsets.all(29),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      ),
    );
  }

}
