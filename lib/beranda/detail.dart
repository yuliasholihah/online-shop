import 'package:flutter/material.dart';
import 'package:reseller/beranda/beranda_model.dart';
import 'package:reseller/constant.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          color: Colors.white,
          child: new Column(
            children: <Widget>[_buildDetailAppBar(), _buildKonten()],
          )),
    );
  }
}

Widget _buildDetailAppBar() {
  return new Container(
    padding: EdgeInsets.only(left: 16.0, right: 16.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Image.asset(
          "assets/shop.png",
          height: 50.0,
          width: 50.0,
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Container(
                height: 28.0,
                width: 28.0,
                padding: EdgeInsets.all(6.0),
                decoration: new BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(100.0)),
                    color: Colors.orangeAccent),
                alignment: Alignment.centerRight,
                child: new Icon(
                  Icons.local_bar,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
              new Container(
                padding: EdgeInsets.all(6.0),
                decoration: new BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(5.0)),
                    color: Color(0x50FFD180)),
                child: new Text(
                  "DETAIL PRODUK",
                  style: TextStyle(fontSize: 14.0),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildKonten() {
  return new Container(
      margin: EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: fetchKonten(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new Column(
                children: snapshot.data.map<Widget>((data) {
              return _rowKonten(data);
            }).toList());
          }
          return Center(
            child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: const CircularProgressIndicator()),
          );
        },
      ));
}

Widget _rowKonten(Promo promo) {
  return new Container(
    height: 320.0,
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(bottom: 16.0),
          width: double.infinity,
          height: 1.0,
          color: GojekPalette.grey200,
        ),
        new ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: new Image.asset(
            promo.image,
            height: 172.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        new Text(
          promo.title,
          style: new TextStyle(fontFamily: "NeoSansBold", fontSize: 16.0),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 8.0),
        ),
        new Text(
          promo.content,
          maxLines: 2,
          softWrap: true,
          style: new TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 6.0),
        ),
        new Container(
          alignment: Alignment.centerRight,
          child: new MaterialButton(
            color: GojekPalette.green,
            onPressed: () {},
            child: new Text(
              promo.button,
              style: new TextStyle(
                  color: Colors.white,
                  fontFamily: "NeoSansBold",
                  fontSize: 12.0),
            ),
          ),
        )
      ],
    ),
  );
}

Future<List<Promo>> fetchKonten() async {
  List<Promo> _poromoList = [];
  _poromoList.add(new Promo(
      image: "assets/image/sw.jpg",
      title: "SWEATER WANITA",
      content: "Ukuran : ALL SIZE"
          "Brand  : NO BRAND"
          "Warna  : PUTIH,PINK,HITAM",
      button: "BELI SEKARANG!"));

  return new Future.delayed(new Duration(seconds: 3), () {
    return _poromoList;
  });
}
