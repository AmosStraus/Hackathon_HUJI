import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:huji_hackathon/guy_files/dummy_users.dart';
import 'package:huji_hackathon/guy_files/user2.dart';
import 'package:huji_hackathon/model/message.dart';
import 'package:huji_hackathon/model/user.dart';
import 'package:huji_hackathon/utils/utils.dart';

class FirebaseApi {
  static Stream<List<MyUser2>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      .orderBy(UserField2.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(MyUser2.fromJson));

  static Future addRandomUsers(List<MyUser2> users) async {
    // get reference
    final refUsers = FirebaseFirestore.instance.collection('users');
    // get content
    final allUsers = await refUsers.get();
    // if its empty do auto init
    if (allUsers.size == 0) {
      for (final user in users) {
        final newUserDocument = refUsers.doc();
        // MyUser newUser = user.copyWith(idUser: newUserDocument.id);
        await newUserDocument.set(user.toJson());
        print(user.email);
        print(user.name);
        print(user.password);
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: user.email, password: user.password);
        print(FirebaseAuth.instance.currentUser);
      }
    }
  }

  /// This method puts the messages in the database
  ///
  static Future uploadMessage(String idUser, String message) async {
    // the connection to firebase
    final referenceMessages =
        FirebaseFirestore.instance.collection('chats/$idUser/messages');

    final newMessage = Message(
      // obama for now //
      // TODO: REMOVE LATER //
      idUser: 'wcWF55gw1IdrAz4Bld7K',
      urlAvatar: DummyUsers2.all_users[0].urlAvatar,
      username: DummyUsers2.all_users[0].name,
      message: message,
      createdAt: DateTime.now(),
    );

    // Add the message to the sender's history
    await referenceMessages.add(newMessage.toJson());

    // Inform the receiver //
    final referenceUsers = FirebaseFirestore.instance.collection('users');
    await referenceUsers
        .doc(idUser)
        .update({UserField.lastMessageTime: DateTime.now()});
  }

  /// This method gets the messages in the database
  ///
  static Stream<List<Message>> getMessages(String idUser) =>
      FirebaseFirestore.instance
          .collection('chats/$idUser/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));
}
