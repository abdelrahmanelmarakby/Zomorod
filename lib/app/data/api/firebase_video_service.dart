import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zomorod/app/data/models/video_model.dart';

class VideoService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<bool> addVideo(VideoModel video) async {
    DocumentReference documentReference = _firestore.collection("Videos").doc();

    await FirebaseFirestore.instance
        .runTransaction((transaction) async {
          transaction.set(
            documentReference,
            video
                .copyWith(
                  id: documentReference.id,
                )
                .toMap(),
          );
        })
        .onError((error, stackTrace) {
          BotToast.showText(text: "Error");
          BotToast.closeAllLoading();
        })
        .then((value) => BotToast.showText(text: "Video Added"))
        .catchError((error) {
          BotToast.closeAllLoading();
          return BotToast.showText(text: "Error : $error");
        });
    return true;
  }

  static Future<bool> addCommentToVideo(String videoId, Comment comment) async {
    DocumentReference documentReference =
        _firestore.collection("Videos").doc(videoId);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        {
          "comments": FieldValue.arrayUnion([comment.toMap()])
        },
      );
    });
    return true;
  }

  Stream<List<Comment>> getComments(String videoId) {
    return _firestore.collection("Videos").doc(videoId).snapshots().map(
        (event) =>
            event
                .data()!["comments"]
                ?.map<Comment>((e) => Comment.fromMap(e))
                .toList() ??
            []);
  }

  static Future deleteVideoToUser({required String videoId}) async {
    await _firestore.collection("Videos").doc(videoId).delete();

    // ignore: avoid_print
    print("Deleted");
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllUserVideos(
      List<String> uids) async {
    // ignore: avoid_print
    print("uids $uids");

    final data = await _firestore
        .collection("Videos")
        .orderBy("createdAt", descending: true)
        .where("uid", whereIn: uids)
        .get();
    return data;
  }

  static Future removeReactionFromVideo(String videoId, String uid) async {
    DocumentReference documentReference =
        _firestore.collection("Videos").doc(videoId);
    return await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        {
          "reactions": FieldValue.arrayRemove([
            {
              "uid": uid,
            }
          ])
        },
      );
    });
  }
}
