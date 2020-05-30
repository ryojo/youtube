import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE = "AIzaSyBpY_RzF4sWDrolNDwYS6UBHXBA_nj7STw";
const CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "/search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE"
            "&channelId=$CANAL"
            "&q=$pesquisa");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.ConverterJson(json) ;
      }).toList();

      return videos;

      //  for(var video in videos){
      //  print("resultado:" + video.titulo);
      //}

      /* for (var video in dadosJson["items"]){
          print("resultado:" + video.toString());
        }*/
      //print("resultado:" + dadosJson["items"].toString());
    } else {
      print("404");
    }
  }
}
