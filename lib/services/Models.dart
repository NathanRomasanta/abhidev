import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
 late String FirstName;
 late String shortInfo;
 late String LastName;

 late String thumbnailUrl;
 late String LongDescription;
 late  String status;
 late int price;


  ItemModel(
      {required this.FirstName,
        required this.LastName,

        required this.thumbnailUrl,
        required this.LongDescription,
        required this.status,
        required this.price,
      });

  ItemModel.fromJson(Map<String, dynamic> json) {
    FirstName = json['title'];
    shortInfo = json['shortInfo'];

    thumbnailUrl = json['thumbnailUrl'];
    LongDescription = json['LongDescription'];
    status = json['status'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.FirstName;
    data['shortInfo'] = this.shortInfo;
    data['Price'] = this.price;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['LongDescription'] = this.LongDescription;
    data['status'] = this.status;
    return data;
  }
}