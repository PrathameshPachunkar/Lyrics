class lyricsmodel{
  late String trackname ;
  late int trackid;
  late String artist;
  late int rating ;
  late int explicit;
  late int albumnname;

  lyricsmodel({required this.trackname, required this.trackid, required this.artist});
}
class trackmodel{
  late int rating;
  late String trackname ;
  late int trackid;
  late String artist;
  late String albumname;

  trackmodel(
      {required this.rating, required this.trackname, required this.trackid, required this.artist, required this.albumname});
}
