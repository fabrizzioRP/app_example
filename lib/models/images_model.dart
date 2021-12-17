// To parse this JSON data, do
//
//     final imagenesRandom = imagenesRandomFromJson(jsonString);

import 'dart:convert';

List<ImagenesRandom> imagenesRandomFromJson(String str) =>
    List<ImagenesRandom>.from(
        json.decode(str).map((x) => ImagenesRandom.fromJson(x)));

class ImagenesRandom {
  int id, albumId;
  String title, url, thumbnailUrl;

  ImagenesRandom({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory ImagenesRandom.fromJson(Map<String, dynamic> json) => ImagenesRandom(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
