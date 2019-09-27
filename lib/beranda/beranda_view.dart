import 'package:flutter/material.dart';
import 'package:reseller/beranda/beranda_model.dart';
import 'package:reseller/beranda/beranda_reseller_appbar.dart';
import 'package:reseller/constant.dart';
import 'dart:async';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<GojekService> _gojekServiceList = [];

  @override
  void initState() {
    super.initState();

    _gojekServiceList.add(new GojekService(
        image: Icons.shop, color: GojekPalette.menuRide, title: "FLASH SALE"));
    _gojekServiceList.add(new GojekService(
        image: Icons.add_box, color: GojekPalette.menuCar, title: "PAKET"));
    _gojekServiceList.add(new GojekService(
        image: Icons.network_cell,
        color: GojekPalette.menuBluebird,
        title: "DISKON"));
    _gojekServiceList.add(new GojekService(
        image: Icons.apps, color: GojekPalette.menuFood, title: "LAINNYA"));
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        appBar: new GojekAppBar(),
        backgroundColor: GojekPalette.grey,
        body: new Container(
          child: new ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      _buildGopayMenu(),
                      _buildGojekServicesMenu(),
                    ],
                  )),
              new Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: new Column(
                  children: <Widget>[
                    _buildGoFoodFeatured(),
                    _buildMakeupFeatured(),
                    _buildPromo()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGopayMenu() {
    return new Container(
        height: 120.0,
        decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(3.0))),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(12.0),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                  ),
                  borderRadius: new BorderRadius.only(
                      topLeft: new Radius.circular(3.0),
                      topRight: new Radius.circular(3.0))),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "SALDO RESELLER",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "NeoSansBold"),
                  ),
                  new Container(
                    child: new Text(
                      "Rp. 120.000",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontFamily: "NeoSansBold"),
                    ),
                  )
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/icon_stok.ico",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Stok",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/icon_produk.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Produk",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/icon_kontak.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Kontak",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/icon_lainnya.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Lainnya",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildGojekServicesMenu() {
    return new SizedBox(
        width: double.infinity,
        height: 120.0,
        child: new Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 4,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowGojekService(_gojekServiceList[position]);
                })));
  }

  Widget _rowGojekService(GojekService gojekService) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return _buildMenuBottomSheet();
                  });
            },
            child: new Container(
              decoration: new BoxDecoration(
                  border: Border.all(color: GojekPalette.grey200, width: 1.0),
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(20.0))),
              padding: EdgeInsets.all(12.0),
              child: new Icon(
                gojekService.image,
                color: gojekService.color,
                size: 32.0,
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0),
          ),
          new Text(gojekService.title, style: new TextStyle(fontSize: 10.0))
        ],
      ),
    );
  }

  Widget _buildGoFoodFeatured() {
    return new Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text(
            "FASHION",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new Text(
            "Pilihan Terlaris",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new SizedBox(
            height: 172.0,
            child: FutureBuilder<List>(
                future: fetchFood(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new ListView.builder(
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(top: 12.0),
                      physics: new ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _rowGoFoodFeatured(snapshot.data[index]);
                      },
                    );
                  }
                  return Center(
                    child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: const CircularProgressIndicator()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildMakeupFeatured() {
    return new Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text(
            "MAKEUP",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new SizedBox(
            height: 172.0,
            child: FutureBuilder<List>(
                future: fetchmakeup(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new ListView.builder(
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(top: 12.0),
                      physics: new ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _rowGoFoodFeatured(snapshot.data[index]);
                      },
                    );
                  }
                  return Center(
                    child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: const CircularProgressIndicator()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _rowGoFoodFeatured(Food food) {
    return new Container(
      margin: EdgeInsets.only(right: 16.0),
      child: new Column(
        children: <Widget>[
          new ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: new Image.asset(
              food.image,
              width: 132.0,
              height: 132.0,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new Text(
            food.title,
          ),
        ],
      ),
    );
  }

  Widget _buildPromo() {
    return new Container(
        margin: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: fetchPromo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Column(
                  children: snapshot.data.map<Widget>((data) {
                return _rowPromo(data);
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

  Widget _rowPromo(Promo promo) {
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

  Widget _buildMenuBottomSheet() {
    return new StatefulBuilder(builder: (c, s) {
      return new SafeArea(
          child: new Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        width: double.infinity,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(4.0), color: Colors.white),
        child: new Column(children: <Widget>[
          new Icon(
            Icons.drag_handle,
            color: GojekPalette.grey,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "RESELLER Services",
                style: new TextStyle(fontFamily: "NeoSansBold", fontSize: 18.0),
              ),
              new OutlineButton(
                color: GojekPalette.green,
                onPressed: () {},
                child: new Text(
                  "EDIT RESELLER",
                  style:
                      new TextStyle(fontSize: 12.0, color: GojekPalette.green),
                ),
              ),
            ],
          ),
          new Container(
            height: 300.0,
            child: new GridView.builder(
                physics: new NeverScrollableScrollPhysics(),
                itemCount: _gojekServiceList.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowGojekService(_gojekServiceList[position]);
                }),
          ),
        ]),
      ));
    });
  }

  Future<List<Food>> fetchFood() async {
    List<Food> _goFoodFeaturedList = [];
    _goFoodFeaturedList
        .add(new Food(title: "Sweater Wanita", image: "assets/image/sw.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "Jeans PULL&BEAR", image: "assets/image/j.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "Baju Polos", image: "assets/image/bp.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "Jaket Levis", image: "assets/image/jkt.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "Baju Crop", image: "assets/image/bc.jpg"));

    return new Future.delayed(new Duration(seconds: 1), () {
      return _goFoodFeaturedList;
    });
  }

  Future<List<Food>> fetchmakeup() async {
    List<Food> _goFoodFeaturedList = [];
    _goFoodFeaturedList
        .add(new Food(title: "Wardah", image: "assets/image/war.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "Make Over", image: "assets/image/mko.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "Maybelin", image: "assets/image/may.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "Viva", image: "assets/image/viv.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "Emina", image: "assets/image/emina.jpg"));

    return new Future.delayed(new Duration(seconds: 1), () {
      return _goFoodFeaturedList;
    });
  }

  Future<List<Promo>> fetchPromo() async {
    List<Promo> _poromoList = [];

    _poromoList.add(new Promo(
        image: "assets/image/pm1.jpg",
        title: "SHOPPING BIG SALE",
        content:
            "Nikmatin DISKON besar besaran belanja sepuasnya tanpa harus takut KEMAHALAN,AYO SEGERA!!!",
        button: "MAU!"));
    _poromoList.add(new Promo(
        image: "assets/image/pm2.jpg",
        title: "hari belanja NASIONAL!!",
        content:
            "it's shopping time ini hari belanja nasional bagi kalian yang sering belanja online ayoo gabung segera",
        button: "SELENGKAPNYA"));
    _poromoList.add(new Promo(
        image: "assets/image/pm3.jpg",
        title: "#TIPS PROMO",
        content:
            "SIAPA SIH YANG GAMAU PROMO???pasti pada mau kan yaah apalagi kalo promo besar besaran disini nih tips nyaa guys",
        button: "CARI TAU!"));
    _poromoList.add(new Promo(
        image: "assets/image/pm5.jpg",
        title: "FLASH SALE x8",
        content:
            "LIVE NOWW!!!! jangan lupa hari ini ada flash sale X8 don't forget guys!!.",
        button: "LAKSANAKAN"));
    return new Future.delayed(new Duration(seconds: 3), () {
      return _poromoList;
    });
  }
}
