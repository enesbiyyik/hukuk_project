import 'package:flutter/material.dart';
import 'package:hukuk_ui/ui/detail_page.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double bottomNavHeight = 50;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(bottomNavHeight == 50){
          return true;
        }else{
          setState(() {
            bottomNavHeight = 50;
          });
          return false;
        }
      },
      child: Scaffold(
        bottomNavigationBar: bottomNav(), 
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/22, left: 24,),
              child: Text("Akış", style: TextStyle(fontSize: 48, fontFamily: "Genel", fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 12),
                width: double.maxFinite,
                //*DB ile birleştirirken ListView.Builder ile değiştirebilirsin knk
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment. spaceEvenly,
                    children: [
                      FeedItem(
                        "Boşandıktan Sonra Tekrar Evlenerek Tazminat Almak", 
                        "Kıdem tazminatı almak için boşanıp tekrar evlenmek kanuna karşı hile sayılır.", 
                        "2020", 
                        "Av Banu Tavşan",
                        feedHashtag: FeedHashtag("#kıdemtazminatı", Colors.red),
                      ),
                      FeedItem(
                        "Performans Düşüklüğü Nedeniyle Fesih ve İşverenin İspat Yükü", 
                        "Performans düşüklüğünün düzeltilmesi için davacıya verilen 2 aylık süre yetersiz kabul edilir.", 
                        "2019", 
                        "Av. Ahmet Polat",
                        feedHashtag: FeedHashtag("#işeiadedavası", Colors.green),
                      ),
                      FeedItem(
                        "Anayasal Düzene Karşı İşlenen Suçlar, Resmi Belgede Sahtecilik", 
                        "Resmi belgelerde bilerek ve aldatmaya yönelik yapılan değişiklikler ve sahte düzenlemeler.", 
                        "2020", 
                        "Av Ayşe Korkmaz",
                        feedHashtag: FeedHashtag("#sahtecilik", Colors.purple),
                      ),
                      FeedItem(
                        "Anayasal Düzene Karşı İşlenen Suçlar", 
                        "Kıdem tazminatı almak için boşanıp tekrar evlenmek kanuna karşı hile sayılır.", 
                        "2020", 
                        "Av Banu Tavşan",
                        feedHashtag: FeedHashtag("#kıdemtazminatı", Colors.orange),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNav() {
    return Container(
      height: bottomNavHeight,
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 10),],),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomAppBar(
            child: Row(
              mainAxisAlignment: bottomNavHeight == 50 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                bottomNavHeight == 50 ? Padding(
                  padding: const EdgeInsets.only(left: 20,top: 5, bottom: 5),
                  child: IconButton(icon: Icon(Icons.auto_fix_high), onPressed: (){
                    setState(() {
                      bottomNavHeight = 450;
                    });
                  }),
                ) : Container(),
                bottomNavHeight == 50 ? IconButton(icon: Icon(Icons.file_present), onPressed: (){}) : Container(),
                bottomNavHeight == 50 ? Padding(
                  padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
                  child: IconButton(icon: Icon(Icons.list), onPressed: (){}),
                ) : Container(
                  child: Text("Buraya, Senin Akinatör Gelicek!"),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class FeedHashtag extends StatelessWidget {
  final String hashtag;
  final Color color;
  FeedHashtag(this.hashtag, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(hashtag, style: TextStyle(fontFamily: "Genel", color: Colors.white,),),
      ),
    );
  }
}

class FeedItem extends StatelessWidget {
  //*DB Den gelen verilerle indexleyerek atarız buraya
  final FeedHashtag feedHashtag;
  final String title;
  final String description;
  final String lawyerName;
  final String date; //* knk farklı formatta da alırız ben açıkçası şu an raad olsun diye sttring aldım
  FeedItem(this.title, this.description, this.date, this.lawyerName, {this.feedHashtag});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title, description, "Some Text Here", date, lawyerName, feedHashtag))),
          child: Container(
            padding: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width-40,
            height: MediaQuery.of(context).size.height/4.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: (feedHashtag.color).withOpacity(0.16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 10, child: Container(child: Text(title, style: TextStyle(fontFamily: "Genel", fontWeight: FontWeight.bold, fontSize: 18),))),
                Expanded(flex: 5, child: Container(child: RichText(text: TextSpan(text: date, style: TextStyle(color: Colors.grey.shade700, fontFamily: "Genel", fontSize: 16), children: [TextSpan(text: " - "), TextSpan(text: lawyerName)])))),
                Expanded(flex: 9, child: Container(child: Text(description, style: TextStyle(fontFamily: "Genel", fontWeight: FontWeight.w500, fontSize: 14),))),
                Expanded(flex: 8, child: Container(child: Row(children: [feedHashtag],))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}