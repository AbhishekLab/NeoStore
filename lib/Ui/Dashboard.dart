import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:neostore/contract/product_contract.dart';
import 'package:neostore/presenter/ProductPresenter.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> implements ProductView {
  var presenter;
  @override
  Widget build(BuildContext context) {
    presenter = ProductPresenter(this);
    return Scaffold(
      drawer: _drawerHeader(context),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("NeoSTORE"),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _imageSlider(),
            _gridView(context),
          ],
        ),
      ),
    );
  }

  Widget _drawerHeader(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black54,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media.phillyvoice.com/media/images/smoking_weed_and_your_heart.2e16d0ba.fill-1200x630-c0.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Text(
                      "User Name",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "Email id",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            _drawerList(),
          ],
        ),
      ),
    );
  }

  Widget _drawerList() {
    final item = [
      'My Cart',
      'Table',
      'Sofa',
      'Chair',
      'Cupboards',
      'My Account',
      'Store Locator',
      'My Order',
      'log Out'
    ];

    final drawerIcons = [
      Icons.shopping_cart,
      Icons.tablet,
      Icons.wifi,
      Icons.battery_alert,
      Icons.lock,
      Icons.print,
      Icons.person,
      Icons.reorder,
      Icons.visibility_off
    ];
    return Expanded(
      child: Container(
          height: double.maxFinite,
          child: ListView.builder(
              itemCount: item == null ? 0 : item.length,
              itemBuilder: (BuildContext context, i) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: new Text(
                        item[i],
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      leading: Icon(
                        drawerIcons[i],
                        color: Colors.white,
                      ),
                      trailing: Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                );
              })),
    );
  }

  Widget _imageSlider() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Carousel(
              images: [
                AssetImage("images/weed1.jpg"),
                AssetImage("images/weed2.jpg"),
                AssetImage("images/weed3.jpg"),
                AssetImage("images/weed4.jpg")
              ],
              noRadiusForIndicator: true,
              indicatorBgPadding: 5,
              dotSize: 7,
              dotBgColor: Colors.transparent,
              dotIncreasedColor: Colors.brown,
              dotColor: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  Widget _gridView(BuildContext context) {
    return Expanded(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        children: <Widget>[
          InkWell(
            onTap: () {
              presenter.getProduct("1");
             /* Navigator.pushNamed(context, '/FurniturePage',
                  arguments: "Tables");*/
            },
            child: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Tables",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Image(
                            image: AssetImage("images/chillam.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/FurniturePage',
                  arguments: "Sofas");
            },
            child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/hukka.png"),
                      height: 100,
                      width: 100,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Sofas",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/FurniturePage',
                  arguments: "Chairs");
            },
            child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Chairs",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Image(
                            image: AssetImage("images/bong.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/FurniturePage',
                  arguments: "Cupboards");
            },
            child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/pipe.png"),
                      fit: BoxFit.cover,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Cupboards",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }



  @override
  void error(String msg) {
    print(msg);
  }

  @override
  void fetchAllProduct(String msg) {
    print(msg);
  }

}
