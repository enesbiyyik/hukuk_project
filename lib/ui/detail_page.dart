import 'package:flutter/material.dart';
import 'package:hukuk_ui/my_app.dart';

class DetailPage extends StatefulWidget {
  //* Bir önceki ekrandan tıkladığına göre alıyorsun bunu!
  final String _title;
  final String _description;
  final String _longText;
  final String _date;
  final String _lawyer;
  final FeedHashtag _feedHashtag;
  DetailPage(this._title, this._description, this._longText, this._date, this._lawyer, this._feedHashtag);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/20, left: 24, right: 24),
            margin: EdgeInsets.only(bottom: 10),
            child: Text(widget._title, style: TextStyle(fontSize: 24, fontFamily: "Genel", fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 24, right: 24),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(widget._lawyer + " - " + widget._date, style: TextStyle(fontSize: 16, fontFamily: "Genel",),),
                ),
                widget._feedHashtag,
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: widget._feedHashtag.color.withOpacity(0.2),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 8, left: 20, right: 20, ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //*DB den gelecek text için değişkene atadım yukarıda
                      Text(widget._longText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}