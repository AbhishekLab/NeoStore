import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/Ui/ToolBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'FurniturePage.dart';

class ItemDescriptionPage extends StatefulWidget {
  @override
  _ItemDescription createState() => _ItemDescription();
}

class _ItemDescription extends State<ItemDescriptionPage> {
  var getImages = [
    'https://www.vmcdn.ca/f/files/rmotoday/images/cannabis.jpg;w=960',
    'https://ravishly.com/sites/default/files/images/article/2019-05/smoking%2520weed.jpg',
    'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2016/10/pot-big-1475729230.jpg',
    'https://miro.medium.com/max/12000/1*ByZGlDhVe-7M9Hs4RB213w.jpeg',
    'https://www.snewsnet.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:good%2Cw_1200/MTU1NDU0OTE1ODg2NDU4NTYy/marijuana-leaves.png'
  ];

  FollowersModel data;
  NetworkImage setImage;
  var colorIndex = 0;

  @override
  initState() {
    super.initState();
    setImage = NetworkImage(getImages[0]);
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: toolbar(data.title),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[300],
        child: itemHeader(),
      ),
    );
  }

  Widget itemHeader() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Category - ${data.category}",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        data.author,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      RatingBar(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  )
                ],
              )),
          Container(
            child: _cardScreen(),
          ),
          _buyNRate(),
        ],
      ),
    );
  }

  Widget _cardScreen() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(18),
      child: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "RS 23000",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Image(
                  image: AssetImage("images/ic_share.png"),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 18, right: 18),
                  child: Image(
                    image: setImage,
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: getImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return _optionsImagesHZ(index);
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
            ),
            Text(
              "DESCRIPTION",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Marijuana is a mix of dried, shredded leaves and flowers from the marijuana plant. It is often green, brown, or gray.",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  Widget _optionsImagesHZ(int index) {
    return Container(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 2, //
                color: colorIndex == index ? Colors.red : Colors.white),
          ),
          width: 120,
          height: 100,
          margin: EdgeInsets.only(left: 5, right: 5),
          child: Image(
            image: NetworkImage(getImages[index]),
            fit: BoxFit.fill,
          ),
        ),
        onTap: () {
          setState(() {
            setImage = NetworkImage(
              getImages[index],
            );
            colorIndex = index;
          });
        },
      ),
    );
  }

  Widget _buyNRate() {
    return Container(
      margin: EdgeInsets.only(left: 18,right: 18,bottom: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         Expanded(
           child: InkWell(
             child: Container(
               alignment: Alignment.center,
               decoration: BoxDecoration(
                   color: Colors.red,
                   borderRadius: BorderRadius.all(Radius.circular(15))
               ),
               margin: EdgeInsets.only(right: 2),
               height: 50,
               child: Text("BUY", textAlign: TextAlign.center,style: TextStyle(fontSize: 25, color: Colors.white),),
             ),
             onTap: (){
               Navigator.pushNamed(context, "/MyCart");
             },
           ),
         ),
          Expanded(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 2),
                height: 50,
                child: Text("RATE", textAlign: TextAlign.center,style: TextStyle(fontSize: 25, color: Colors.grey[700]),),
              ),
              onTap: (){
                print("fsdfsdf");
              },
            ),
          )
        ],
      ),
    );
  }
}
