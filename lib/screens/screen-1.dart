import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrics/network_helper.dart';
import 'package:lyrics/screens/loadingscreen.dart';
import 'package:lyrics/screens/screen_2.dart';

import '../datamodel.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}




class _Screen1State extends State<Screen1> {
  @override

 late  List<lyricsmodel> trackdata = [];
  bool nodata = true;
  String? lyrics;
  void getdata()async{
    Trackdetails data = Trackdetails();
    await  data.networkhelper();
    trackdata=  data.data;
    setState(() {
      if(trackdata!=null){
        nodata = false;
      }
    });

  }

  void s3data(int trackdata)async{
    Screen_3_data fetchlyrics = Screen_3_data(trackdata);
    await fetchlyrics.getdatascreen3();
    lyrics =fetchlyrics.lyrics;
  }
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Trending",style: TextStyle(
          color: Colors.grey.shade800
        ),),
      ),

      body: ListView.separated(

         itemCount: trackdata.length,
          itemBuilder:(Builder , index){
           return nodata?loadingscreen():GestureDetector(
             onTap: (){

              setState(() {
                s3data(trackdata[index].trackid);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(
                  track_id: trackdata[index].trackid,
                  trackname: trackdata[index].trackname,
                  lyrics: lyrics??"",

                ),
                ),
                );
              });
             },
             child: Container(
               height: 80,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Icon(Icons.library_music_rounded,
                     color: Colors.grey,
                   ),

                   Expanded(
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 20),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(
                             width: MediaQuery.of(context).size.width/2,
                             child: Text(trackdata[index].trackname,
                               style: TextStyle(

                                 overflow: TextOverflow.ellipsis,
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                             ),
                           ), // Song name

                           Text(trackdata[index].trackname,style: TextStyle(color: Colors.grey,
                           fontSize: 15
                           ),),//  Album name
                         ],
                       ),
                     ),
                   ),

                   Text(trackdata[index].artist), // Artist name
                 ],
               ),
             ),
           );


          } ,

          separatorBuilder: (build, context){

           return Divider(
             indent: 50,
             endIndent: 50,
             color:Colors.black,
           );
          },),
    );
  }
}
