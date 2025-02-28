import 'package:flutter/material.dart';

class GuestModel {
  final String img;
  final String name;
  final String info;
  final List<String> ImgList;

  GuestModel(
      {required this.img,
      required this.name,
      required this.info,
      required this.ImgList});


  Map<String, dynamic> ToMap() {
    return {
      'img': img,
      'name': name,
      'info': info,
      'imgList': ImgList,
    };
  }

  factory GuestModel.fromMap(Map<String, dynamic> map) {
    return GuestModel(
        img: map['img'],
        name: map['name'],
        info: map['info'],
        ImgList: map['imgList']);
  }

  
}
