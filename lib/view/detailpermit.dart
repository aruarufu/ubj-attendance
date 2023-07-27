import 'package:kb_app/model/api.dart';
import 'package:flutter/material.dart';

class DetailPermit extends StatefulWidget {
  List list;
  int index;
  DetailPermit({this.list, this.index});

  @override
  _DetailPermitState createState() => _DetailPermitState();
}

class _DetailPermitState extends State<DetailPermit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Tanggal dan Waktu'),
                  subtitle: Text(widget.list[widget.index]['tgl_mulai']),
                ),
                Divider(),
                ListTile(
                  title: Text('Nama'),
                  subtitle: Text(widget.list[widget.index]['nama']),
                ),
                Divider(),
                ListTile(
                  title: Text('NPM'),
                  subtitle: Text(widget.list[widget.index]['nik']),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
