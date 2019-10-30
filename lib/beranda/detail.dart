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
              children: <Widget>[
                _buildDetailAppBar(),
                _buildKonten(),
              ],
            )),
        bottomNavigationBar: new Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          "ADD TROLI",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.orange,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          "BELI SEKARANG",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
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
                height: 35.0,
                width: 35.0,
                padding: EdgeInsets.all(7.0),
                decoration: new BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(100.0)),
                    color: Colors.orangeAccent),
                alignment: Alignment.centerRight,
                child: new Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
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
    height: 400.0,
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
          maxLines: 7,
          softWrap: true,
          style: new TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 20.0),
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
      title: "SWEATER WANITA RP 35.000",
      content:
          "Ukuran : (ALL SIZE),SWEATER Multifungsi tersedia dalam ukuran M,L,XL dengan warna BIRU, PINK, PUTIH, dan HITAM. Warna yang terlihat pada foto sesuai dengan warna aslinya. Apabila terdapat perbedaan warna, disebabkan oleh pengaturan monitor dan efek cahaya pada layar monitor Anda",
      button: "LIHAT PROMO!"));

  return new Future.delayed(new Duration(seconds: 3), () {
    return _poromoList;
  });
}
