import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrics/network_helper.dart';

class Screen2 extends StatefulWidget {

  late int track_id;
late String trackname;
 late String lyrics;
  // late int rating;
  // late String artist;
  // late String albumname;
  // late int explixit;

  Screen2({required this.track_id,required this.trackname ,required this.lyrics});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
 bool ispresent = false;
   int? rating;
   String? artist;
   String? albumname;
   String? trackname;
   int? explixit;
    String? lyrics;


late var details;
  void getscreen2data()async{
    screen_2_details data = screen_2_details(trackid: widget.track_id);
      await data.trackdetails();

      rating = data.rating;
      artist = data.artist;
      albumname = data.albumname;
       //trackname = data.trackname ;
      explixit = data.explixit;


  }

  void s3data()async{
    int track = widget.track_id;
    Screen_3_data data3 = Screen_3_data(track);
  await  data3.getdatascreen3();

    setState(() {
      if(data3.lyrics!=null){
        lyrics = data3.lyrics;
      }
      else{
        s3data();
      }
    });



  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s3data();
    setState(() {
     trackname = widget.trackname;

  //   lyrics = widget.lyrics;

   });
    // rating = widget.rating;
    // albumname = widget.albumname;
    // explixit = widget.explixit;
    // artist = widget.artist;
    getscreen2data();

  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Track Details",style: TextStyle(
          fontSize: 25,
          color: Colors.black,

        ),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              track_detail_widget(
                title: "name ",
                field: trackname??"" ,
                albumname: albumname??"",
                rating: "$rating",
                artistname: artist??"",
                explicit: explixit??0,


              ),
              SizedBox(height: 40,),
              Text("Lyrics",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.only(left: 20),
                child:  Text(lyrics??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 20),)
              ),


            ],
          ),
        ),
      )
    );
  }
}

class track_detail_widget extends StatelessWidget {
 late String field;
late String title;
late String artistname ;
late String rating ;
late String albumname;
late int explicit;


 track_detail_widget(
     {required this.field, required this.title, required this.rating, required this.albumname, required this.explicit, required this.artistname});

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          ),// for titile of the field
          Text(field,style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w300
          ),
          ), // field eentry data from api



          SizedBox(
            height: 30,
          ),


          //Artist name


          Text("Artist",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),// for titile of the field
          Text(artistname,style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w300
          ),
          ),

//Albumn name
          SizedBox(
            height: 30,
          ),





          Text("Albumn name ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),// for titile of the field
          Text(albumname,style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w300
          ),
          ),

//Explicit


          SizedBox(
            height: 30,
          ),


          Text("Explicit",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),// for titile of the field
          Text(explicit==1?"True":"False",style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w300
          ),

          ),


//Rating


          SizedBox(
            height: 30,
          ),



          Text("Rating",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),// for titile of the field
          Text(rating,style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w300
          ),),

        ],
      ),
    );
  }
}
