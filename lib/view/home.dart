import 'package:kb_app/view/absensi.dart';
import 'package:kb_app/view/dokum.dart';
import 'package:kb_app/view/input_permit.dart';
import 'package:kb_app/view/spkanggota.dart';
import 'package:kb_app/view/location.dart';
import 'package:kb_app/view/permit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

const List<String> iconNames = <String>[
  'images/svgicon/home.svg'
      'images/svgicon/location.svg'
      'images/svgicon/dokum.svg'
      'images/svgicon/agenda.svg'
      'images/svgicon/permit/svg'
      'images/svgicon/spk.svg'
      'images/svgicon/presensi.svg'
      'images/svgicon/profile.svg'
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userid = "",
      username = "",
      namalengkap = "",
      //jabatan = "",
      nik = "";
  //foto = "",
  //urlfoto = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString("id");
      username = preferences.getString("username");
      namalengkap = preferences.getString("nama");
      //jabatan = preferences.getString("jabatan");
      nik = preferences.getString("nik");
      // = preferences.getString("foto");
      //urlfoto = foto;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  static final List<String> imgSlider = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Divider(
            height: 1,
            color: Colors.white,
          ),
          Akun(
            userid: userid,
            username: username,
            namalengkap: namalengkap,
            //jabatan: jabatan,
            nik: nik,
            // url: urlfoto,
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          MenuUtama(),
        ],
      ),
    );
  }
}

class Akun extends StatelessWidget {
  String userid, username, namalengkap, jabatan, kodekantor, nik, url;
  Akun(
      {this.userid,
      this.username,
      this.namalengkap,
      // this.jabatan,
      this.nik,
      this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.amber[700],
      child: new GestureDetector(
        onTap: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) => null)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 100.0,
            ),
            title: Text(
              nik ?? '25361253',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  namalengkap ?? 'User demo',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                new Text(
                  jabatan ?? 'Mahasiswa',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.amber[700],
      child: Container(
        padding: EdgeInsets.all(25.0),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: <Widget>[
            Column(
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.blueGrey[50],
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "images/svgicon/presensi.svg",
                      width: 110,
                      height: 110,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => InputPermit()));
                    },
                    padding: EdgeInsets.all(13),
                    color: Colors.white,
                    iconSize: 100.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Scan',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.blueGrey[50],
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "images/svgicon/permit.svg",
                      width: 110,
                      height: 110,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => Permit()));
                    },
                    padding: EdgeInsets.all(13),
                    color: Colors.white,
                    iconSize: 100.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Log',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
