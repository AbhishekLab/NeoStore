import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ToolBar.dart';

class FurniturePage extends StatefulWidget {
  @override
  _FurnitureRv createState() => _FurnitureRv();
}

class _FurnitureRv extends State<FurniturePage> {
  String title;
  @override
  Widget build(BuildContext context) {
    title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: toolbar(title),
      body: _tableList(title),
    );
  }
}

Widget _tableList(String title) {
  List<FollowersModel> data = [
    FollowersModel(title: 'This is Abhishek kumar', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Avinash kumar', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Anjali kumari', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Avinash kumar', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Anjali kumari', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Avinash kumar', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Anjali kumari', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Avinash kumar', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Anjali kumari', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Avinash kumar', author: 'Abhishek', category: title),
    FollowersModel(title: 'This is Anjali kumari', author: 'Abhishek', category: title)
  ];

  return Container(
      child: ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return _tableItems(data, index, context);
    },
  ));
}

Widget _tableItems(List<FollowersModel> data, int index, BuildContext context) {
  return InkWell(
    onTap: (){
      Navigator.pushNamed(context, '/ItemDescriptionPage', arguments: data[index]);
    },
    child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(5),
            child: Image(
              image: AssetImage("images/weed1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, left: 8),
                  child: Text(data[index].title,
                      style: TextStyle(fontSize: 18),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4, left: 8),
                  child: Text(data[index].title,
                      style: TextStyle(fontSize: 13),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text("RS. 25,000",
                            style: TextStyle(fontSize: 22, color: Colors.red[600]),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis),
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
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class FollowersModel {
  String title;
  String author;
  String category;

  FollowersModel({this.title, this.author, this.category});
}
