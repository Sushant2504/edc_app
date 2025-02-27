import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class VideoModel {
    final String VideoLink;

    VideoModel({required this.VideoLink});

    // factory VideoModel.fromSnapshot(Snapshot<DocumentSnapshot> snapshot) {
    //     return VideoModel(
    //         VideoLink: snapshot.data['videoLink'] as String,
    //     );
    // }
}
