
import 'package:http/http.dart' as http;

import 'dart:convert';



import 'datamodel.dart';

class Trackdetails{

  List<lyricsmodel>data = [];
  List returenddata =[];
 // late int pageindex = 1;

 // Trackdetails(this.pageindex);

  Future networkhelper() async {


    var response = await http.get(Uri.parse(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=cdc2a00eefa42731cdae837af1178724&page_size=80')); // &page=$pageindex& for indexing the pages
    var Response = json.decode(response.body);
    List resonselist = Response['message']['body']['track_list'] as List;

    resonselist.forEach((element) {
      returenddata.add(element);
    });
    returenddata.map((e) {

      lyricsmodel data2 = lyricsmodel(trackname: e['track']['track_name']??'', trackid: e['track']['track_id']??'', artist: e['track']['artist_name']??'');
      data.add(data2);
      return data2;
    } ).toList();

  }


}
class screen_2_details{
  late int trackid;
  late int rating;
  late String artist;
  late String albumname;
   String trackname = "";
  late int explixit;


  screen_2_details({required this.trackid});

  trackdetails() async {
    var response = await http.get(Uri.parse('https://api.musixmatch.com/ws/1.1/track.get?apikey=cdc2a00eefa42731cdae837af1178724&track_id=$trackid'));
    var responsedata = json.decode(response.body);
    var responselist = responsedata['message']['body']['track'] ;
    trackname =responselist['track_name']??"";
    rating = responselist['track_rating'];
    artist = responselist['artist_name'];
    albumname = responselist['album_name'];
    explixit = responselist['explicit'];



  }


}
class Screen_3_data{
  late int trackid;

  Screen_3_data(this.trackid);

  late String lyrics;
  getdatascreen3()async{
    var response = await http.get(Uri.parse('https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackid&apikey=cdc2a00eefa42731cdae837af1178724'));
    var responsedata = json.decode(response.body);
    lyrics = responsedata['message']['body']['lyrics']['lyrics_body'].toString();
   // print(lyrics);
    return lyrics;
  }
}
