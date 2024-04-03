
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:mxpertz_test/Model/post.dart';
import 'package:mxpertz_test/services/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload Post
  Future<String> uploadPost(
    String description, Uint8List file,String uid,String username,String profImage
  )async{
     String res = 'Some Error occured';
    try {
      String photoUrl =await StorageMethods().uploadImageToStorage('posts', file, true);
     
      String postId = Uuid().v1();
      Post post = Post(
       description: description,
       uid: uid,
       username: username,
       likes: [], 
       postId:postId, 
       datePublished: DateTime.now(), 
       postUrl: photoUrl, 
       profImage: profImage
       );

       _firestore.collection('posts').doc(postId).set(post.toJson());
       res = 'Success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
  Future<void> likePost(String postId,String uid,List likes)async{
    try {
      if (likes.contains(uid)) {
     await   _firestore.collection('posts').doc(postId).update({
           'likes':FieldValue.arrayRemove([uid]),
        });
      }else{
      await   _firestore.collection('posts').doc(postId).update({
           'likes':FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> postComment(String postId,String text,String profilePic,String name,String uid)async{
    try {
      if (text.isNotEmpty) {
        String commentId = Uuid().v1();
      await   _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
          'profilePic':profilePic,
          'name':name,
          'text':text,
          'commentId':commentId,
          'datePublished':DateTime.now()
        });
      }else{
        print('Text is Empty');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // Deleting the post
  Future<void> deletePost(String postId)async{
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
  

}